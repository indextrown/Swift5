//func isPrime(_ num: Int) -> Bool {
//    if num <= 1 { return false }
//    
//    for i in 2..<num {
//        if num % i == 0 {
//            return false
//        }
//    }
//    return true
//}
//
//print(isPrime(1) ? "소수입니다" : "소수가 아닙니다")


// randomElement는 옵셔널 타입을 반환하기 때문에 강제 언래핑 필요
//func randString(_ inp: String) -> String {
//    return String(inp.randomElement()!)
//}
//
//randString("안녕하세요")



//func factorial(_ num: Int) -> Int {
//    if num <= 1 {return 1}
//    return num * factorial(num-1)
//}
//
//print(factorial(5))



//func isPrime(_ num: Int) -> Bool {
//    if num <= 1 { return false }
//    
//    for i in 2..<num {
//        if num % i == 0 {
//            return false
//        }
//    }
//    return true
//}
//
//print(isPrime(1) ? "소수입니다" : "소수가 아닙니다")


// 연습문제1: 문자열을 입력하면 그중 한개의 글자를 랜덤으로 뽑아주는 함수를 만들어 보자
//func randString1(_ inp: String) -> Character {
//    var cnt = inp.count
//    var rand = Int.random(in: 0..<cnt)
//    let index = inp.index(inp.startIndex, offsetBy: rand)
//    return inp[index]
//}
//// randString1("안녕하세요")


func randString(_ inp: String) -> String {
    // inp 길이
    var inpCount = inp.count
    // 랜덤 인덱스 생성
    var rand = Int.random(in: 0..<inpCount)
    // 시작 인덱스에서 rand 만큼의 offset을 가진 인덱스를 계산한다
    // 즉 inp 문자열 내의 rand 번째 문자의 위치를 나타낸다
    let index = inp.index(inp.startIndex, offsetBy: rand)
    return String(inp[index])
}

randString("안녕하세요")


