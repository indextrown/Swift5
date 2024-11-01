//
//  HomeViewModel.swift
//  LMessenger
//
//  Created by 김동현 on 11/1/24.
//

import Foundation
import Combine

class HomeViewModel:ObservableObject {
    enum Action {
        case load
        case presentMyProfileView
        case presentOtherProfileView(String)
    }
    
    @Published var myUser: User?
    @Published var users: [User] = []
    @Published var phase: Phase = .notRequested
    @Published var modalDestination: HomeModalDestination?
 
    private var userId: String
    private var container: DIContainer
    private var subscriptions = Set<AnyCancellable>()
    
    init(container: DIContainer, userId: String) {
        self.container = container
        self.userId = userId
    }
    
    func send(action: Action) {
        switch action {
        case .load:
            phase = .loading
            
            // TODO: -
            container.services.userService.getUser(userId: userId)
                .handleEvents(receiveOutput: { [weak self] user in
                    self?.myUser = user
                })
                .flatMap { user in
                    self.container.services.userService.loadUsers(id: user.id)
                }
                .sink { [weak self] completion in
                    // TODO:
                    if case .failure = completion {
                        self?.phase = .fail
                    }
                } receiveValue: { [weak self] users in
                    self?.phase = .success
                    self?.users = users
                }.store(in: &subscriptions)
            
            /*
                .sink { completion in
                    // TODO: -
                } receiveValue: { [weak self] user in
                    self?.myUser = user
                }.store(in: &subscriptions)
             */

            return
        case .presentMyProfileView:
            modalDestination = .myProfile
            
        case let .presentOtherProfileView(userId):
            modalDestination = .otherProfile(userId)
        }
    
    }
    

}
//@Published var users: [User] = [.stub1, .stub2]

