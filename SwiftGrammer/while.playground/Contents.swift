// while 조건문
// while문 내에서는 조건을 변화시킬 수 있는 문장이 들어가야 한다
// 그렇지 않으면 무한 loop이 발생

var sum = 0
var num = 1

//while num <= 10 {
//    print(num)
//    num += 1
//}
//

while num <= 50 {
    sum += num
    num += 1
}

print(sum)

// for와 while 차이
// for: 반복횟수가 정해져 있을 떄 사용
// while: 조건을 가지고 판별을한다(조건이 만족하는동안 반복 실행)
