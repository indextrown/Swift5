//
//  MyProfileViewModel.swift
//  LMessenger
//
//  Created by 김동현 on 2/3/25.
//

import Foundation

final class MyProfileViewModel: ObservableObject {
    
    @Published var userInfo: User?
    
    private let userId: String
    private var container: DIContainer
    
    init(container: DIContainer, userId: String) {
        self.container = container
        self.userId = userId
    }
}
