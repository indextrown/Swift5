/*
 
 (104강)
 클래스에만 상속이 존재한다
 구조체에는 상속이 존재하지 않는다
 상속이 필요하면 클래스를 사용한다
 
 상속이란
 - 본질적으로 성격이 비슷한 타입을 새로 만들어 데이터(저장속성)을 추가하거나 기능(메서드)를 변형시켜서 사용하려는것
 
 재정의불가이유(뒤에 다시 배움)
 - 기존 메모리 공간을 그대로 유자하기 위해
 
 결론
 - 상속이란 저장속성 즉 메모리공간을 추가하는 개념이다
 
 base클래스
 - 어떤 클래스도 상속하지 않은 클래스
 
 
 
 */


class Person {
    // 저장속성(자체로 메모리 공간을 가짐)
    var id = 0
    var name = "이름"
    var email = "abc@email.com"
}

// 새로운 타입인데 Person과 유사
// 유사하기 때문에 Person클래스로 기본으로 둔 다음에 하나의 저장속성만 추가할 때
// 상속 사용하는 경우: 새로운 타입을 만들어서 저장속성을 추가하는 개념
// 저장속성이 추가된다 = 메모리가 추가된다 = 상속
class Student: Person {
    var studentId = 0
}

class Undergradulate: Student {
    // id
    // name
    // email
    // studentId
    var major = "전공"
}

var person1 = Undergradulate()
person1.id
person1.name
person1.email
person1.studentId
person1.major


