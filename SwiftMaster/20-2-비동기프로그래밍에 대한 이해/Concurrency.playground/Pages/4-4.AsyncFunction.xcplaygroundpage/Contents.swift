//: [Previous](@previous)
import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


//: ### 작업을 오랫동안 실행하는 함수가 있다고 가정

// MARK: - 작업을 오랫동안 실행하는 함수가 있다고 가정
func longtimePrint(name: String) -> String {
    print("프린트 - 1")
    sleep(1)
    print("프린트 - 2")
    sleep(1)
    print("프린트 - 3 이름:\(name)")
    sleep(1)
    print("프린트 - 4")
    sleep(1)
    print("프린트 - 5")
    return "작업 종료"
}


//longtimePrint(name: "잡스")




func longtimePrint2(name: String, com: @escaping () -> Void) {
    DispatchQueue.global().async {
        print("프린트 - 1")
        sleep(1)
        print("프린트 - 2")
        sleep(1)
        print("프린트 - 3 이름:\(name)")
        sleep(1)
        print("프린트 - 4")
        sleep(1)
        print("프린트 - 5")
        com()
    }
}


// Corrected function call with closure
longtimePrint2(name: "잡스") {
    print("작업 완료")
}



//: # 동기함수를 비동기함수로 만들기
// MARK: - 동기함수를 비동기함수로 만들기
// 작업을 오랫동안 실행하는데, 동기적으로 동작하는 함수를
// 비동기적으로 동작하도록 만들어, 반복적으로 사용하도록 만들기
// 내부적으로 다른 큐로 비동기적으로 보내서 처리
// MARK: 리턴형이 있기 때문에 리턴형을 전달하기 위해 completion 핸들러(클로저)를 만들고 실행
func asyncLongtimePrint(name: String, completion: @escaping (String) -> Void) {
    DispatchQueue.global().async {
        // MARK: 결과가 늦게 나오는데 그 결과를 n에 담고 전달한다
        let n = longtimePrint(name: name)
        completion(n)
    }
}

//asyncLongtimePrint(name: "잡스", completion: <#T##(String) -> Void#>)
asyncLongtimePrint(name: "잡스") { (result) in
    print(result)
    
    // 메인쓰레드에서 처리해야하는 일이라면,
    DispatchQueue.main.async {
        print(result)
    }
}










sleep(7)
PlaygroundPage.current.finishExecution()
//: [Next](@next)
//Copyright (c) 2021 we.love.code.allen@gmail.com
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
//distribute, sublicense, create a derivative work, and/or sell copies of the
//Software in any work that is designed, intended, or marketed for pedagogical or
//instructional purposes related to programming, coding, application development,
//or information technology.  Permission for such use, copying, modification,
//merger, publication, distribution, sublicensing, creation of derivative works,
//or sale is expressly withheld.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.
