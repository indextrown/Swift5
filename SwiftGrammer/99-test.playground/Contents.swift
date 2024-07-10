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
