//
//  main.swift
//  AppDebug
//
//  Created by 김동현 on 10/30/24.
//

/*
import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

var result: String = ""
let file = FileIO()
let N = file.readInt()


for _ in 0..<N {
    let a = file.readInt(), b = file.readInt()
    result += "\(a + b)\n"
}

FileHandle.standardOutput.write(result.data(using: .utf8)!)

print(result)
*/

//
//import Foundation
//
//class People {
//    var name: String
//    var age: Int
//    
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}
//
//protocol ServiceType {
//    func getPeople() -> People
//}
//
//class Services: ServiceType {
//    func getPeople() -> People {
//        return People(name: "Index", age: 30)
//    }
//}
//
//let services = Services()
//var person: People = services.getPeople()
//
//func shiwPersonInfo() {
//    print("Name: \(person.name), Age: \(person.age)")
//}
//
//shiwPersonInfo()
//



enum Person {
    case doctor
    case student
}

func send(person: Person) {
    switch person {
    case .doctor:
        print("의사")
        return
    case .student:
        print("학생")
        return
    }
}

send(person: .doctor)

enum MainTabType: String, CaseIterable {
    case home
    case ranking
    case profile
    
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .ranking:
            return "랭킹"
        case .profile:
            return "프로필"
        }
    }
    
//    func imageName(selected: Bool) -> String {
//
//    }
}

print(MainTabType.allCases)
