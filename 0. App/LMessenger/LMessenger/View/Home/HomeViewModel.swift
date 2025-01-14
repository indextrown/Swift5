//
//  HomeViewModel.swift
//  LMessenger
//
//  Created by 김동현 on 1/14/25.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var myUser: User?
    @Published var users: [User] = [.stub1, .stub2]
    
}
