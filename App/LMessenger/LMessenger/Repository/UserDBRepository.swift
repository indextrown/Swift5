//
//  UserDBRepository.swift
//  LMessenger
//
//  Created by 김동현 on 11/1/24.
//

import Foundation
import Combine
import FirebaseDatabase

// 규격
protocol UserDBRepositoryType {
    func addUser(_ object: UserObject) -> AnyPublisher<Void, DBError>
    func getUser(userId: String) -> AnyPublisher<UserObject, DBError>
    func loadUsers() -> AnyPublisher<[UserObject], DBError>
    
    
}

class UserDBRepository: UserDBRepositoryType {
    
    // 파이어베이스 db접근하려면 래퍼런스 객체가 필요하다
    var db: DatabaseReference = Database.database().reference()
    
    func addUser(_ object: UserObject) -> AnyPublisher<Void, DBError> {
        // object -> data화시킨다 -> dic만들어서 값을 -> DB에 넣는다
        Just(object)
            .compactMap { try? JSONEncoder().encode($0) }
            .compactMap { try? JSONSerialization.jsonObject(with: $0, options: .fragmentsAllowed) } // 딕셔너리화
        
            // Realtime Database는 Combine을 제공하지 않기 때문에 flatmap으로 그 안에 future정의해서 stream을 이어주자
            .flatMap { value in
                Future<Void, Error> { [weak self] promise in // Users/userId/...
                    self?.db.child(DBKey.Users).child(object.id).setValue(value) { error, _ in
                        if let error {
                            promise(.failure(error))
                        } else {
                            promise(.success(()))
                        }
                    }
                }
            }
            // DBError로 에러 타입을 변환해서 퍼블리셔로 보내자
            .mapError { DBError.error($0) }
            .eraseToAnyPublisher()
    }
    
    func getUser(userId: String) -> AnyPublisher<UserObject, DBError> {
        Future<Any?, DBError> { [weak self] promise in
            self?.db.child(DBKey.Users).child(userId).getData {error, snapshot in
                if let error {
                    promise(.failure(DBError.error(error)))
                    // DB에 해당 유저정보가 없는걸 체크할때 없으면 nil이 아닌 NSNULL을 갖고있기 떄문에 NSNULL일경우 nil을 아웃풋으로 넘겨줌
                } else if snapshot?.value is NSNull {
                    promise(.success(nil))
                } else {
                    promise(.success(snapshot?.value))
                }
            }
        }.flatMap { value in
            if let value {
                return Just(value)
                    .tryMap { try JSONSerialization.data(withJSONObject: $0)}
                    .decode(type: UserObject.self, decoder: JSONDecoder())
                    .mapError { DBError.error($0) }
                    .eraseToAnyPublisher()
            // 값이 없다면
            } else {
                return Fail(error: .emptyValue).eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }
    
    
    func loadUsers() -> AnyPublisher<[UserObject], DBError> {
        Future<Any?, DBError> { [weak self] promise in
            self?.db.child(DBKey.Users).getData { error, snapshot in
                if let error {
                    promise(.failure(DBError.error(error)))
                    // DB에 해당 유저정보가 없는걸 체크할때 없으면 nil이 아닌 NSNULL을 갖고있기 떄문에 NSNULL일경우 nil을 아웃풋으로 넘겨줌
                } else if snapshot?.value is NSNull {
                    promise(.success(nil))
                } else {
                    promise(.success(snapshot?.value))
                }
            }
        }
        // 딕셔너리형태(userID: Userobject) -> 배열형태
        .flatMap { value in
            if let dic = value as? [String: [String: Any]] {
                return Just(dic)
                    .tryMap { try JSONSerialization.data(withJSONObject: $0)}
                    .decode(type: [String: UserObject].self, decoder: JSONDecoder()) // 형식
                    .map { $0.values.map {$0 as UserObject} }
                    .mapError { DBError.error($0) }
                    .eraseToAnyPublisher()
            } else if value == nil {
                return Just([]).setFailureType(to: DBError.self).eraseToAnyPublisher()
            } else {
                return Fail(error: .invalidatedType).eraseToAnyPublisher()
            }
        }
        .eraseToAnyPublisher()
    }
}
