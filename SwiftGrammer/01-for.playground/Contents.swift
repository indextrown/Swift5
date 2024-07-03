// 기존 for문
for i in 0...10 {
    //print(i)
}

// _: 와일드카드패턴, 생략의 의미일 때 언더바를 자주 사용한다
// 임시적으로 담아 두었다가 사라져도 상관 없을 때 사용한다
for _ in 0...10 {
    //print("hello")
}

// 범위 연산자를 내림차순으로 쓸 수 없다
// 10...1 불가
// 하지만 뒤집을 수 있다
// 1...10.reversed()
for i in (0...10).reversed() {
    //print(i)
}

// ReversedCollection<(ClosedRange<Int>)>
let a = (1...10).reversed()

// 컬렉션에서 각 아이템을 순서대로 뽑아서 중괄호 안에서 사용
let list = ["Swift", "Programming", "Language"]

// 배열 출력 가능
for str in list {
    //print(str)
}

// 문자열 출력 가능
for chr in "Hello" {
    // let chr = 'H'
    // let chr = 'e'
    // ..
    // let chr = 'o'
    //print(chr)
}

// 역순으로 바꾸기
for number in (1...5).reversed() {
    //print(number)
}

// stride: 1부터 10까지 성큼성금 걷는데 2씩 증가
// to의 숫자는 포함하지 않음
// 1 3 5 7  9
for i in stride(from: 1, to: 10, by: 2) {
    // print(i)
}

// 1부터 10까지 출력
var number: Int = 10
for i in 1...number {
     //print(i)
}

// 1부터 10까지 합 =. 5
var sum: Int = 0
for i in 1...10 {
    sum += i
    print(sum)
}
 

