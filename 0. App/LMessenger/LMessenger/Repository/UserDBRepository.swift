//
//  UserDBRepository.swift
//  LMessenger
//
//  Created by 김동현 on 1/15/25.
//

import Foundation
import Combine
import FirebaseDatabase

protocol UserDBRepositoryType {
    func addUser(_ object: UserObject) -> AnyPublisher<Void, DBError>
}

final class UserDBRepository: UserDBRepositoryType {
    
    // MARK: - 파이어베이스 DB에 접근하려면 래퍼런스 객체가 필요하다
    // reference는 데이터베이스에서 root에 해당한다
    
    var db: DatabaseReference = Database.database().reference()
    
    /*
    func addUser(_ object: UserObject) -> AnyPublisher<Void, DBError> {
        // 파이어베이스에 데이터를 쓰려면 딕셔너리 형태로 넘겨야 한다
        // object > data > dict -> db에 삽입
        // 데이터 변환은 Combine연산자 이용하여(체이닝하여)작업을 진행해보자
        
        // 1. object를 stream으로 만들기 위해 Just로 만들어주자
        Just(object)
            // 2. 인코딩하는 작업을 compactMap으로 연결해주자
            /*
             첫 번째 compactMap:
             UserObject를 JSON 형식의 Data로 변환합니다.
             이 과정에서 JSONEncoder가 데이터를 인코딩하다가 실패할 경우, nil을 반환합니다.
             compactMap은 nil을 필터링해 스트림에서 제거하고, 성공적으로 인코딩된 데이터만 다음 단계로 전달합니다.
             
             두 번째 compactMap:
             JSON 형식의 Data를 Firebase에서 사용 가능한 딕셔너리([String: Any])로 변환합니다.
             JSONSerialization이 데이터를 변환하다가 실패하면 nil을 반환하므로, 역시 compactMap이 이를 제거합니다.
             */
            .compactMap { try? JSONEncoder().encode($0) }   // object > data
            .compactMap { try? JSONSerialization.jsonObject(with: $0, options: .fragmentsAllowed) } // data > dict
        
            // 3. db에 set하는 작업 진행을 flatMap으로 진행하자
            // realtime database는 Combine제공하지 않아서 FlatMap 안에 Future를 정의해서 스트림을 이어주자
            /*
             flatMap은 스트림을 확장하거나 비동기 작업을 처리하는 데 사용됩니다.
             flatMap 안에서 Firebase에 데이터를 저장하는 작업을 비동기로 처리합니다.
             Future를 사용해 비동기 작업의 결과를 Combine 스트림에 연결합니다.
             promise(.success(())): Firebase에 성공적으로 데이터를 저장한 경우.
             promise(.failure(error)): Firebase 작업이 실패한 경우.
             
             왜 flatMap을 사용하는가?
             Firebase와 같은 비동기 작업을 Combine 스트림에서 처리하기 위해 사용합니다.
             flatMap은 비동기 작업이 완료될 때까지 기다리고, 그 결과를 스트림에 다시 연결합니다.
             이 방식으로 Firebase의 비동기 콜백을 Combine 스트림으로 통합하여 처리할 수 있습니다.
             */
            .flatMap { value in
                
                /*
                 Future
                 - 한 번만 값을 방출하는 비동기 작업을 처리하기 위해 사용
                 - 비동기 작업을 Combine 스트림으로 연결하는 다리
                 - Firebase 작업(Future) → Combine 체인에 결과 전달
                 - 결과는 성공(.success)이든 실패(.failure)든 Combine에서 처리 가능
                 
                 Future를 사용하지 않고 처리하면?
                 - Firebase 작업을 직접 처리하려면 아래처럼 복잡한 콜백 코드가 필요
                 
                 db.child("Users").child(object.id).setValue(value) { error, _ in
                     if let error = error {
                         // 에러 처리
                     } else {
                         // 성공 처리
                     }
                 }
                 
                 왜 Future를 사용하는가?

                 비동기 콜백을 Combine 스트림으로 연결
                 Firebase와 같은 비동기 콜백 기반 API를 사용하는 경우, Swift의 Result나 콜백 블록으로 처리해야 합니다.
                 이때 Future를 사용하면 해당 비동기 콜백을 Combine 퍼블리셔로 바꿀 수 있어, 체이닝이 가능해집니다.
                 한 번 결과를 내고 끝나는 작업에 적합
                 Future는 한 번만 값을 방출하고, 이후에는 완료(completion) 상태로 바뀝니다.
                 예:
                 “DB에 데이터를 쓰고, 성공하면 Void, 실패하면 Error를 리턴하겠다” → 작업이 한 번만 일어나는 경우
                 Combine 연산자와 자유롭게 결합
                 flatMap, mapError, eraseToAnyPublisher 등 다양한 Combine 연산자와 함께 사용해 스트림을 원하는 대로 조합할 수 있습니다.

                 
                 */
                Future<Void, Error> { [weak self] promise in    // Users/userId/..
                    // 4. 값이 정상적으로 세팅되거나 실패가 나면 컴풀리션으로 에러와 응답값을 준다
                    self?.db.child("Users").child(object.id).setValue(value) { error, _ in
                        // 5. 만약 에러가 있으면 promise에 failure를 넘기자
                        if let error {
                            promise(.failure(error))
                        } else {
                            promise(.success(()))
                        }
                    }
                }
            }
            // Error를 DBError로 변형해서 퍼블리셔로 보낼예정
            .mapError { DBError.error($0) }
            .eraseToAnyPublisher()
        //Empty().eraseToAnyPublisher()
    }
     */
    func addUser(_ object: UserObject) -> AnyPublisher<Void, DBError> {
        Just(object)
            .compactMap { try? JSONEncoder().encode($0) }   // object > data
            .compactMap { try? JSONSerialization.jsonObject(with: $0, options: .fragmentsAllowed) } // data > dict
            .flatMap { value in
                Future<Void, Error> { [weak self] promise in
                    self?.db.child(DBKey.Users).child(object.id).setValue(value) { error, _ in
                        if let error {
                            //print("[Error]", error)
                            promise(.failure(error))
                        } else {
                            promise(.success(()))
                        }
                    }
                }
            }
            .mapError { DBError.error($0) }
            .eraseToAnyPublisher()
    }
 }
 
