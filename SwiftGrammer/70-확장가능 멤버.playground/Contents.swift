/*
 
 (120강)
 
 
 */

// 타입 계산속성의 확장
// 타입속성: 붕어빵틀에속해있는것
// 메모리구조가 실제 인스턴스와 다르게 데이터 영역에 있는 붕어빵 틀과 관련된 속성
// static을 붙이면 타입속성이 된다
extension Double {
    // 타입 계산ㄴ속성
    static var zero: Double {
        return 0.0
    }
}
Double.zero




// 인스턴스 계산 속성의 확장
extension Double {
    var km: Double {
        return self * 1_000.0
    } // 인스턴스 자신에 1000 곱하기
    var m: Double {
        return self
    }
    
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

// self는 미터 기준으로 구현
10.0.km     // 10,000m
10.0.cm     // 0.1m

let oneInch = 25.4.mm
print("1인치는 \(oneInch) 미터 ")        // 1인치는 0.0254미터

let threeFeet = 3.ft
print("3피트는 \(threeFeet) 미터 ")      // 3피트는 0.914399970739201 미터

let aMaraton = 42.km + 195.m
print("마라톤은 \(aMaraton) 미터의 길이임") // 마라톤은 42195.0 미터의 길이임

// 편한 방법
extension Int {
    var squared: Int {
        return self * self
    }
}

// 불편한 방법
func squared(num: Int) -> Int {
    return num * num
}
