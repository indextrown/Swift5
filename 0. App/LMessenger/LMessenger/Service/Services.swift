//
//  Services.swift
//  LMessenger
//
//  Created by 김동현 on 1/13/25.
//

import Foundation

protocol ServiceType {
    var authService: AuthenticationServiceType { get set }
}

final class Services: ServiceType {
    var authService: AuthenticationServiceType
    
    init() {
        authService = AuthenticationService()
    }
}

final class StubServices: ServiceType {
     var authService: AuthenticationServiceType = StubAuthenticationService()
}
