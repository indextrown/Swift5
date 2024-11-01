//
//  UserService.swift
//  LMessenger
//
//  Created by 김동현 on 11/1/24.
//

import Foundation
import Combine

protocol UserServiceType {
    // MARK: - 여기는 서비스 layer이기 때문에 DTO가 아닌 User모델을 받도록 하자
    func addUser(_ user: User) -> AnyPublisher<User, ServiceError>
    func getUser(userId: String) -> AnyPublisher<User, ServiceError>
    func loadUsers(id: String) -> AnyPublisher<[User], ServiceError>
    
}

class UserService: UserServiceType {
    private var dbRepository: UserDBRepositoryType
    
    init(deRepository: UserDBRepositoryType) {
        self.dbRepository = deRepository
    }
    
    func addUser(_ user: User) -> AnyPublisher<User, ServiceError> {
        dbRepository.addUser(user.toObject())
            .map { user }
            .mapError { .error($0) }
            .eraseToAnyPublisher()
    }
    
    func getUser(userId: String) -> AnyPublisher<User, ServiceError> {
        dbRepository.getUser(userId: userId)
            .map { $0.toModel() }
            .mapError { .error($0) }
            .eraseToAnyPublisher()
    }
    
    func loadUsers(id: String) -> AnyPublisher<[User], ServiceError> {
        dbRepository.loadUsers()
            .map { $0
                .map { $0.toModel() }
                .filter { $0.id != id }
            }
            .mapError { .error($0) }
            .eraseToAnyPublisher()
    }
}

class StubUserService: UserServiceType {
    func addUser(_ user: User) -> AnyPublisher<User, ServiceError> {
        Empty().eraseToAnyPublisher()
    }
    
    func getUser(userId: String) -> AnyPublisher<User, ServiceError> {
        Just(.stub1).setFailureType(to: ServiceError.self).eraseToAnyPublisher()
    }
    
    func loadUsers(id: String) -> AnyPublisher<[User], ServiceError> {
        Just([.stub1, .stub2]).setFailureType(to: ServiceError.self).eraseToAnyPublisher()
    }
}

// 실제 구현체와 의존성이 없으므로 실제 유저DB 리퍼지토리가 아닌 다른 구현체에도 주입을 할 수가 있고
// 느슨한 결합을 하기 위해 사용..
