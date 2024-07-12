//
//  RPS.swift
//  RPSGame
//
//  Created by 김동현 on 7/12/24.
//

import Foundation

// 열거형 생성
// 앱이 컴파일되서 010101되는 순간 모든 파일들이 code 영역에 들어간다
// 코드 영역에 들어가고, 데이터로서 사용할 수 있다면 데이터 영역에도 일정 부분 존재
// 실제 프로젝트에서 파일들을 수백개씩 나누어서 구분한다. 정상적인 방식-> 개발자가 관리하기 편함

// 원시값(raw value) Int 설정
enum Rps: Int {
    case rock       // 0
    case paper      // 1
    case scissors   // 2
}

// command + b로 저장(빌드)
