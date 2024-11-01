//
//  ContentView.swift
//  AppTest
//
//  Created by 김동현 on 11/1/24.
//
// https://velog.io/@jyw3927/SwiftUI-MVVM-패턴에-대해

// MARK: - 버튼을 누르면 숫자가 증가하고 3의 배수이면 표시하는 MVVM
import SwiftUI

// MARK: - Model
struct Counter {
    var value: Int = 0
    var isPrime: Bool {
        value != 0 && value.isMultiple(of: 3)
    }
    
    mutating func increment() {
        self.value += 1
    }
}

// MARK: - ViewModel
class MyViewModel: ObservableObject {
    @Published private var counter: Counter = .init()
    
    var value: Int {
        counter.value
    }
    
    var primium: Bool {
        counter.isPrime
    }
    
    func increment() {
        counter.increment()
    }
}

// MARK: - View
struct MyView: View {
    @StateObject private var myVM: MyViewModel = .init()
    
    var body: some View {
        VStack {
            Text("\(myVM.value)")
                .font(.title)
            
            Text(myVM.primium ? "PREMIUM": "")
                .foregroundColor(Color.green)
                .frame(width: 200, height: 100)
                .font(.largeTitle)
            
            Button {
                myVM.increment()
            } label: {
                Text("버튼")
            }
        }
    }
}

#Preview {
    MyView()
}


