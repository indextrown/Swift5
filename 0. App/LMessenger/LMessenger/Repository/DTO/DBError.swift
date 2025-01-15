//
//  DBError.swift
//  LMessenger
//
//  Created by 김동현 on 1/15/25.
//

import Foundation

// DB Layer에서 다룰 수 있는 에러타입 추가
enum DBError: Error {
    case error(Error)
    
//    var errorDescription: String? {
//        switch self {
//            
//        case .error(let underlyingError):
//            return "DB에러: \(underlyingError.localizedDescription)"
//        }
//    }
}
