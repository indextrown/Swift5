//
//  1.swift
//  Swift5
//
//  Created by 김동현 on 2/3/25.
//

// MARK: - self 키워드(공식문서 클로저 내용과 유사)
// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures
import Foundation
import SwiftUI

var 함수저장변수: (() -> Void)?

// MARK: - 함수 파라미터가 heap에 저장되어 오래동안 쓰임 => 캡처현상 발생가능
func escapingClosure(함수파라미터: @escaping () -> Void) {
    /*
     @escaping 필수 이유
     - input으로 쓰이는 함수가 외부 변수에 저장이 되기 때문에 실행 중인 함수를 벗어나더라도 파라미터가 쓰이기 떄문
     - 함수는 참조타입이라 함수가 외부 변수에 저장되면 heap이라는 메모리 영역에 클로저가 생긴다 = 클로저가 heap에 저장되어 오래동안 쓰일 수 있다
     */
    함수저장변수 = 함수파라미터
}

// MARK: - 함수 파라미터가 heap에 저장되지 않아 오래동안 쓰이지 않음 => 캡처현상 발생x
func nonEscapingClosure(함수파라미터: () -> Void) {
    함수파라미터()
}

// MARK: - 클래스 내에서 클로저 사용시 어떤 경우는 self를 반드시 붙혀야 하고 어떤 경우는 안붙힌다
class 클래스 {
    var x = 10
    func doSomething() {
        
        escapingClosure { /// [self] in 명시적으로 self를 작성하거나 클로저의 캡처 리스트에 self를 포함
            self.x = 100  /// 명시적 self참조(나중에 사용할꺼니까, self 캡처할거야) // 나중에 호출시 실행
        }
        nonEscapingClosure {    /// 즉시 실행
            x = 200             /// 암시적 self 참조(self붙혀도 되긴 함)
        }
        DispatchQueue.global().async { /// 본질적으로 @escaping 클로저 (heap에 저장됨)
            self.x = 300
        }
    }
}

@main
struct Main {
    static func main() {
        
        
        
    }
}

