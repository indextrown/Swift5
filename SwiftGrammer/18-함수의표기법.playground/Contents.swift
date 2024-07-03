// 함수 표기법(지칭)


// 실행문
// doSomething()

// 함수를 가리킴
// doSomething
// 정의한 함수는 some이라는 이름도 가짐
// 함수를 가리키는데 필요시 사용
// some 변수도 doSomething()을 가리킴, !!실행은 아님!!
// var some = doSomethihg
// somw()



//let point: (Int, Int) = (1, 2)
//point.0
//point.1



let point: (x: Int, y: Int) = (1, 2)
point.0
point.1
point.x
point.y

let (first, second) = point
first
second
