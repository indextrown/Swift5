// 파라미터 a 타입은 let
// 상수는 변할 수 없다
func someAdd(a: Int) -> Int {
    // 값 변경법
    var b = a
    b += 1
    return b
}
print(someAdd(a: 10))



// 함수 내에서 선언한 변수와 scope 범위
func numberPrint(n num: Int) {
    if num >= 5 {
        print("숫자가 5 이상입니다. ")
        return
    }
    print("숫자가 5 미만입니다. ")
}
//numberPrint(n: 10)

func nameString() -> String {
    return "김동현"
}

var myname: String = nameString()
print(myname)



// 5. 함수의 중첩 사용
func chooseStepFunction(backward: Bool, value: Int) -> Int {
    
    // 선언문
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    
    if backward {
        // 실행문
        return stepBackward(input: value)
    } else {
        return stepForward(input: value)
    }
}

var value = 7
print(chooseStepFunction(backward: true, value: 10))
