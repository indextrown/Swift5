//
//  viewModel.swift
//  SwiftLintTest
//
//  Created by 김동현 on 2/24/25.
//

func test() {
    let mystr = "11"
    let abc = Int(mystr)!  // 여기서 force_unwrapping 경고가 발생해야 함
    print(abc)
}

func test2() {
    let arr = [1, 2, 3]
    
    if arr.count == 0 {
        print("비어있음")
    }
}
