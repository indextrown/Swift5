//
//  ContentView.swift
//  SwiftLintTest
//
//  Created by 김동현 on 2/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            test()
        }
    }
}

#Preview {
    ContentView()
}
