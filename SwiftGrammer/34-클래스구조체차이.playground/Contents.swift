/*
 
 (86강)
 
 클리스와 구조체
 - 메모리 저장 방식이 다르다
 
 구조체
 - 값형식(Value Type)
 - 모든 인스턴스 데이터를 stack에 저장
 - 복사시 값을 전달할때마다 복사본을 생성한다(또다른 메모리 공간 생성)
 
 클래스
 - 참조형식(reference type)
 - 객체의 데이터 주소를 담는 변수는 stack에 저장하고 stack에서 heap에 있는실제 데이터를 가리킨다
 - 복사시 값을 전달하는 것이 아니라 저장된 주소를 전달
 - !!!복사해서 담는 행위는 메모리 주소값을 복사해서 담는다!!!
 
 구조체는 가벼워서 주로 사용
 클래스는 heap 메모리에 저장해서 무거움
 heap은 데이터를 길게 저장하기 위해 사용한다
 
 // 클래스에서는 let으로 선언해도 속성을 바꿀 수 있음
 // 구조체에서는 let으로 선언하면 속성을 바꿀 수 없음
 // 구조체를 let으로 선언하면 가지고있는 속성 모두가 let이 되어버림 -> 메모리구조가 stack에 생기기때문
 // class에서 let은 메모리 주소를 바꿀수없다는 의미, 다른 객체를 가리킬수없다는의미
 // 가리키고있는 속성은 var로 선언되어 있기 때문
 
 점문법/명시적 멤버 표현식 정확한 의미
 - 하위에 있는 속성이나 메서드를 가리킨다
 - 문자열도 실제로 구조체로 만들어져있음
 - 메모리의 인스턴스를 찍어내는 행위랑 같음
 - "안녕하세요".count 가능
 
 일반적으로 클래스, 구조체 선언할 때
 1) 속성, 2) 메서드 순서대로 작성
 
 주의
 - 클래스 내부에는 메서드 실행문이 올 수 없다
 - 클래스는 붕어빵 틀이라서 무언가를 실행하기 위한 틀이 아니라 선언 부분이라서 코드를 실행하기 위한 명령어는 올 수 없음
 - 메서드의 실행문은 메서드의 정의문 내에 존재해야함
 
 
 
 정리
 - 클래스와 구조체는 근본적인 메모리 저장방식의 차이가 있다
 - 클래스: 변수는 stack영역에 생성되고 메모리 주소를 담고 있지만 실제 data는 heap 영역에 생성된다
 - 복사할 떄 메모리 주소만 복사해서 같은 data를 가리킨다
 - let 선언시 메모리 주소를 바꿀 수 없다는 의미
 
 - 구조체: 메모리 생성을 stack에 한다
 - 복사할 때 전체 data를 복사한다. 경우에 따라 비효율적
 - let 선언시 전체 내부의 속성 즉 변수 모두가 let이 된다
 
 Dog(): 대문자시작 + 소괄호 = 붕어빵을 찍어내는행위 = 인스턴스의 생성이라는 것 중요
 
 */



class Person {
    var name = "사람"
}

struct Animal {
    var name = "동물"
}

// 클래스
var p = Person()
p.name

// 클래스의 변수를 복사하는 경우 메모리 주소를 복사해서 담는거라서 동일한 데이터를 가리킨다
// p(사람)를 p2에 담는다 -> 복사
// p2도 원래 사람, p1도 원래 사람 가리킴 -> 동일한 데이터를 가리킴
var p2 = p
p2.name = "Index"
p.name  // Index    메모리주소가 동일
p2.name // Index    메모리주소가 동일


// 구조체
var a = Animal()
a.name

//
var a2 = a
a.name = "강아지"
a.name  // 강아지
a2.name // 동물



class PersonClass {
    var name = "사람"
    var age = 0
}

struct AnimalStruct {
    var name = "동물"
    var age = 0
}

let pclass = PersonClass()
let astruct = AnimalStruct()


pclass.name = "사람1"

// 클래스에서는 let으로 선언해도 속성을 바꿀 수 있음
// 구조체에서는 let으로 선언하면 속성을 바꿀 수 없음
// 구조체를 let으로 선언하면 가지고있는 속성 모두가 let이 되어버림 -> 메모리구조가 stack에 생기기때문
// class에서 let은 메모리 주소를 바꿀수없다는 의미, 다른 객체를 가리킬수없다는의미
// 가리키고있는 속성은 var로 선언되어 있기 때문
// astruct.name = "동물1"

// 점문법
"안녕하세요".count


// 관습적인 부분

