//
//  OtherProfileView.swift
//  LMessenger
//
//  Created by 김동현 on 1/16/25.
//

import SwiftUI

struct OtherProfileView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            Button {
                dismiss()
            } label: {
                Image("back")
            }
        }
    }
}

#Preview {
    OtherProfileView()
}
