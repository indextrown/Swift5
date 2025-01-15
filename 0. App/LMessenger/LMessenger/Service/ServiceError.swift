//
//  ServiceError.swift
//  LMessenger
//
//  Created by 김동현 on 1/13/25.
//

import Foundation

// 서비스 layer에서 다루는 에러 타입

enum ServiceError: Error {
    /*
     error는 열거형의 한 케이스입니다.
     연관 값을 사용하여 **다른 오류 타입(Error)**을 감쌉니다.
     즉, 이미 존재하는 오류 타입을 포장(wrapper)하여 다룰 수 있습니다.
     */
    
    case dbError(DBError) // DBError를 포함
    case error(Error)
    
    var errorDescription: String {
        switch self {
        case .dbError(let dbError):
            return "DB에러: \(dbError.localizedDescription)"
        case .error(let error):
            return "기타 에러: \(error.localizedDescription)"
        }
    }
}


