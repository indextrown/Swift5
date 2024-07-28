/*
 
 (115강)
 타입캐스팅
 
 is연산자 / as 연산자
 
 */

class Person {
    var id = 0
    var name = "이름"
    var email = "abc@gmail.com"
}

class Student: Person {
    // id
    // name
    // email
    var studentId = 1
}

class Undergraduate: Student {
    // id
    // name
    // studentId
    var major = "전공"
}

let person1 = Person()
person1.id
person1.email


