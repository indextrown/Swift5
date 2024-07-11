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

