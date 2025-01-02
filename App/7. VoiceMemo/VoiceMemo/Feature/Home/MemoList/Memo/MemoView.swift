//
//  MemoView.swift
//  VoiceMemo
//
//  Created by 김동현 on 12/24/24.
//

import SwiftUI

struct MemoView: View {
    @EnvironmentObject private var pathModel: PathModel
    @EnvironmentObject private var memoListViewModel: MemoListViewModel
    @StateObject var memoViewModel: MemoViewModel
    @State var isCreatedMode: Bool = true   // 이니셜로 해도되고 전달로 해도됨
    
    var body: some View {
        ZStack {
            CustomNavigationBar(
                leftBtnAction: {
                    pathModel.paths.removeLast()
                },
                rightBtnAction: {
                    if isCreatedMode {
                        memoListViewModel.addMemo(memoViewModel.memo)
                    } else {
                        memoListViewModel.updateMemo(memoViewModel.memo)
                    }
                    pathModel.paths.removeLast() // 생성버튼 눌러도 뒤로 나와야함
                },
                // 생성모드이면 create 수저/편집모드이면 완료
                rightBtnType: isCreatedMode ? .create : .complete
            )
            
            // 메모 타이틀 인풋 뷰
            
            // 메모 컨텐츠 인풋 뷰
            
            // 삭제 플로팅 버튼 뷰
        }
    }
}

// MARK: - 메모 제목 입력 뷰
private struct MemoTitleInputView: View {
    @ObservedObject private var memoViewModel: MemoViewModel
    @FocusState private var isTitleFieldFocused: Bool
    @Binding private var isCreateMode: Bool
    
    fileprivate init(
        memoViewModel: MemoViewModel,
        isCreateMode: Binding<Bool>
    ) {
        self.memoViewModel = memoViewModel
        self._isCreateMode = isCreateMode
    }
    
    fileprivate var body: some View {
        TextField(
            "제목을 입력하세요.", // placeholder
            text: $memoViewModel.memo.title
        )
        .font(.system(size: 30))
        .padding(.horizontal, 20)
        .focused($isTitleFieldFocused)
        .onAppear {
            if isCreateMode {
                isTitleFieldFocused = true
            }
        }
    }
}

#Preview {
    MemoView(
        memoViewModel: .init(
            memo: .init(
                title: "",
                content: "",
                date: Date()
            )
        )
    )
}
