//
//  AuthenticationViewModel.swift
//  LMessenger
//
//  Created by 김동현 on 1/13/25.
//

import Foundation
import Combine
import AuthenticationServices

enum AuthenticationState {
    case unauthenticated
    case authenticated
}

final class AuthenticationViewModel: ObservableObject {
    
    // MARK: - view에서 원하는 액션 처리를 위한 액션 정의
    enum Action {
        case chechAuthenticationState
        case googleLogin
        case appleLogin(ASAuthorizationAppleIDRequest)
        case appleLoginCompletion(Result<ASAuthorization, Error>)
        case logout
    }
    
    @Published var authenticationState: AuthenticationState = .unauthenticated
    @Published var isLoading: Bool = false
    var userId: String?
    private var container: DIContainer
    private var subscriptions = Set<AnyCancellable>()
    private var currentNonce: String?
    
    init(container: DIContainer) {
        self.container = container
    }
    
    func send(action: Action) {
        switch action {
        case .chechAuthenticationState:
            if let userId = container.services.authService.chechAuthenticationState() {
                self.userId = userId
                self.authenticationState = .authenticated
            }
        case .googleLogin:
            isLoading = true // 로그인중
            // MARK: - sink하면 subscriptions이 return된다 이를 viewModel에서 관리할건데 구독이 하나만 이루어지는게 아니라서 set으로 관리하자
            container.services.authService.signInWithGoogle()
                .sink { [weak self] completion in
                    // 실패시 작업
                    if case .failure = completion {
                        self?.isLoading = false
                    }
                } receiveValue: { [weak self] user in
                    self?.isLoading = false // 값을 받았을 때
                    // 유저정보가 오면 이 뷰에서 유저정보id를 가지고 있자
                    self?.userId = user.id
                    self?.authenticationState = .authenticated
                }.store(in: &subscriptions)
            
        case let .appleLogin(request):
            let nonce = container.services.authService.handleSignInWithAppleRequest(request)
            currentNonce = nonce
            
        case let .appleLoginCompletion(result):
            if case let .success(authorization) = result {
                guard let nonce = currentNonce else { return }
                container.services.authService.handleSignInWithAppleCompletion(authorization, nonce: nonce)
                    .sink { [weak self] completion in
                        // 실패시 작업
                        // 실패시 작업
                        if case .failure = completion {
                            self?.isLoading = false
                        }
                    } receiveValue: { [weak self] user in
                        self?.isLoading = false
                        self?.userId = user.id
                        self?.authenticationState = .authenticated
                    }.store(in: &subscriptions)
            } else if case let .failure(error) = result {
                print(error.localizedDescription)
                self.isLoading = false
            }
        case .logout:
            container.services.authService.logout()
                .sink { completion in
                    
                } receiveValue: { [weak self] _ in
                    self?.authenticationState = .unauthenticated
                    self?.userId = nil
                }.store(in: &subscriptions)
        }
    }
}
