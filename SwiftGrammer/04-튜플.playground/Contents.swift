/*
 
 (19강) 튜플 기본
 
 튜플(Tuple)
 - 원하는 연관된 데이터의 조합으로 어떤 형태든 만들 수 있는 데이터 타입
 - 연관된 데이터를 한꺼번에 모아서 저장을 할 때 사용
 - 반드시 처음에 변수에 데이터 타입어을 어떤 형식으로 선언했으면 해당 형식을 따라야 한다
 
 사용방법
 - 소괄호 사용
 - ("김동현", 25, "부산")
 
 접근방법
 - 변수이름.인덱스     일반 튜플
 - 변수이름.이름      NamedTuple
 
 NamedTuple
 - 인덱스 접근, 이름 접근 둘 다 가능
 - 장점: 가독성이 높다

 튜플의 분해
 - 튜플의 데이터 묶음을 각 한개씩 분해햐여 상수나 변수에 저장 가능하다
 
 튜플의 값 비교
 - 튜플에서는 항상 왼쪽 멤버부터 하나씩 비교한다
 - 현재 멤버가 같을 경우 바로 우측의 멤버를 비교한다
 - swift 기본 지원 튜플은 7개 미만의 요소를 가진 경우 비교 가능하다
 - Swift 문자열 비교 방식은 사전순 비교인데 자세히는 유니코드 값을 비교한다
 - (참고) ASCII는 128개의 문자만 지원하는 반면, 유니코드는 백만 개 이상의 문자 코드를 지원
 - 주의: Bool 값은 비교할 수 없다

 */

// 선언 방식

// 1 정수 2개를 묶은 타입 추론
let myTuple = (1, 2)

// 2 타입 주석을 명시적으로 작성 가능
let myTuple2: (Int, Int) = (1, 2)

// 3 여러 타입 사용 가능
var myTuple3: (String, Int, String) = ("김동현", 25, "부산")

// 4 이름이 매겨진 튜플(Named Tuple)
var Mytuple4: (x: Int, y: Int) = (10, 20)

// 5. 기존 선언된 변수의 데이터를 바꿔서 담을 수 있다
myTuple3 = ("Index", 25, "부산")

// 6. 주의할 점: 선언한 타입 형식을 따른다
// myTuple3 = ("김동현", "부산")


// 튜플의 분해
let test = (1, 0)
let (first, second) = test
first
second

// 튜플 비교
(1, "hello") < (2, "world")
(1, "abc") < (1, "def")
// (1, true) < (2, false) -> 에러





/*
 
 (20강) 튜플의 활용
 튜플을 사용하는 이유
 - (swift 기준) 함수는 리턴값이 하나만 존재하기 때문에 여러 값을 반환할 수 없다
 - 이를 해결하기 위해 여러 묶음 값으로 반환하기 위해 사용한다
 
 튜플 비교 기존 방식
 직접 비교 방식으로 코드 단순화
 switch문은 튜플 매칭을 지원
 바인딩 패턴 가능
 
 */

let t1 = (1, 2)
let t2 = (1, 2)

// 튜플 비교
if t1.0 == t2.0 && t1.1 == t2.1 {
    print("일치")
}

if t1 == t2 {
    print("일치")
}

// 직접 비교 방식
if t1 == (1, 2) {
    print("일치")
}

// switch문은 튜플 매칭을 지원
switch t1 {
case(0, 0):
    print("원점")
case(1, 2):
    print("일치")
default:
    break
}

var point = (10, 0)

switch point {
case(let distance, 0), (0, let distance):
    print("yes")
default:
    print("no")
}
