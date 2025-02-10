//
//  6. Task-3.swift
//  Swift5
//
//  Created by 김동현 on 2/10/25.
//

/*
 Task 클로저에서 self 카워드 사용
 - Task를 생성할 수 있고 클로저 부분을 할당하여 작업을 
 */

@main
struct Main {
    static func main() {
        let comNum = Int.random(in: 1...10)
        
        while true {
            print("1부터 10 사이 원하는 숫자를 입력하세요(힌트: \(comNum)): ", terminator: "")
            let userNum = readLine()!
            
            if let userNum = Int(userNum) {
                // if !(0...10).contains(userNum) {}
                
                /*
                 switch userNum {
                 case let x where !(0...10).contains(x):
                 print("❌ 1부터 10 사이의 숫자를 입력하세요.")
                 default:
                 print("✅ 입력한 숫자: \(userNum)")
                 }
                 */
                
                /*
                 switch userNum {
                 case 0...10:
                 // print("🎉 입력한 숫자: \(userNum), 컴퓨터 숫자: \(comNum)")
                 default:
                 print("❌ 1부터 10 사이의 숫자를 입력하세요.")
                 }
                 */
                
                switch userNum {
                case let x where x == comNum:
                    print("Bingo")
                    return
                case let x where x > comNum:
                    print("Down")
                case let x where x < comNum:
                    print("Up")
                default:
                    print("❌ 1부터 10 사이의 숫자를 입력하세요.")
                }
            }
        }
    }
}
