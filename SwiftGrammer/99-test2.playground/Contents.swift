//// 재귀함수 활용
//func factorial(n: Int) -> Int {
//    if n <= 1 {return 1}
//    return n * factorial(n: n-1)
//}
//
//factorial(n: 5)
//
//
//// 반복문 활용
//func factorialLoop(n: Int) -> Int {
//    var result = 1
//    for i in 1...n {
//        result *= i
//    }
//    return result
//}
//factorialLoop(n: 5)
//
//
//func sumOfTuple(_ tuple: (Int, Int)) -> Int {
//    return tuple.0 + tuple.1
//}
//sumOfTuple((1, 2))


func isPrime(_ num: Int) -> Bool {
    if num <= 1 { return false }
    
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}

print(isPrime(1) ? "소수입니다" : "소수가 아닙니다")

func randString(_ inp: String) -> String {
    var rand = Int.random(in: 0..<inp.count)
    // 시작 인덱스에서 rand 만큼의 offset을 가진 인덱스를 계산한다
    // 즉 inp 문자열 내의 rand 번째 문자의 위치를 나타낸다
    let index = inp.index(inp.startIndex, offsetBy: rand)
    return String(inp[index])
}

print(randString("안녕하세요"))
