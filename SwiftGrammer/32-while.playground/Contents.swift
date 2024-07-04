// while 조건문
// while문 내에서는 조건을 변화시킬 수 있는 문장이 들어가야 한다
// 그렇지 않으면 무한 loop이 발생

// 정리
// for와 while 차이
// for: 반복횟수가 정해져 있을 떄 사용
// while: 조건을 가지고 판별을한다(조건이 만족하는동안 반복 실행)

var sum = 0
var num = 1
while num <= 10 {
    print(num)
    num += 1
}

while num <= 50 {
    sum += num
    num += 1
}
print(sum)

// repeat-while문
// c++의 do-while문 느낌
var i: Int = 1
repeat {
    print("\(3) * \(i) = \(3*i)")
    i += 1
} while i <= 9
            
// 반복문 조건이 false이면 실행 안함
var number = 5
var sumOfnum = 0
while number < 5 {
    sumOfnum += number
    number += 1
}
print(number)

// repeat-while문을 하면 일단 한번은 실행함
repeat {
    sumOfnum += number
    number += 1
} while number < 5
print(number)
