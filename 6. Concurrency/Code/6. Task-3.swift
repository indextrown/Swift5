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

// 
//@main
//struct Main {
//    static func main() {
//        let comNum: Int = Int.random(in: 0...2)
//        
//        print("(가위: 0, 바위: 1, 보: 2)입력: ", terminator: "")
//        let user: String = readLine()!
//
//        
//        if let userNum = Int(user) {
//            if 0...2~=userNum {
//                if userNum == 0, comNum == 0 {
//                    print("무승부")
//                } else if userNum == 0, comNum == 1 {
//                    print("패배")
//                } else if userNum == 0, comNum == 2 {
//                    print("승리")
//                }
//                
//                else if userNum == 1, comNum == 0 {
//                    print("승리")
//                }
//                else if userNum == 1, comNum == 1 {
//                    print("무승부")
//                }
//                else if userNum == 1, comNum == 2 {
//                    print("패배")
//                }
//                
//                else if userNum == 2, comNum == 0 {
//                    print("패배")
//                }
//                else if userNum == 2, comNum == 1 {
//                    print("승리")
//                }
//                else if userNum == 2, comNum == 2 {
//                    print("무승부")
//                }
//                
//            } else {
//                print("0~2 사이의 값을 입력하세요")
//            }
//        } else {
//            print("숫자를 입력해주세요")
//        }
//    }
//}


@main
struct Main {
    static func main() {
        let comNum: Int = Int.random(in: 0...2)

        print("(가위: 0, 바위: 1, 보: 2) 입력: ", terminator: "")
        
        // 안전한 입력 처리
        guard let userInput = readLine(), let userNum = Int(userInput), (0...2).contains(userNum) else {
            print("❌ 0~2 사이의 숫자를 입력하세요.")
            return
        }
        
        // 승패 판별 로직 (배열 활용)
        let resultMatrix = [
            ["무승부", "패배", "승리"],  // userNum == 0 (가위)
            ["승리", "무승부", "패배"],  // userNum == 1 (바위)
            ["패배", "승리", "무승부"]   // userNum == 2 (보)
        ]
        
        let result = resultMatrix[userNum][comNum]
        print("컴퓨터: \(comNum) → 결과: \(result)")
    }
}
