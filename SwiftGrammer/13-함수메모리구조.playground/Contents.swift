/*
 
 
 함수
 - 반복되는 코드를 묵어서 쉽게 실행시킨다
 - 함수를 실행시키면 함수 이름을 찾아가서 코드를 실행시킨다
 

 
 플레이그라운드에 대한 가정(메모리 구조를 잘알기 위해)
 - 플레이그라운드는 main함수가 숨어있음
 - 플레이그라운드 전체 영역 = main함수의 영역이다
 
 
 
 */


func add(_ a: Int, _ b: Int) -> Int {
    var c = a + b
    return c
}

var num1 = 1
var num2 = 2
var num3 = add(num1, num2)

print(num3)
