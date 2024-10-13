//
//  ToodoListView.swift
//  voiceMemo
//

import SwiftUI

struct TodoListView: View {
    // 전역적 선언(작성버튼 누를때 todoview가 보여야 하기 떄문에 사용)
    @EnvironmentObject private var pathModel: PathModel
    
    // StateObject와 ObservableObject로 해도 되지만 
    // todolistview 뿐만아니라 todoview에서도 todolistviewmodel를 사용하려고 하기 때문
    @EnvironmentObject private var todoListViewModel: TodoListViewModel
    
    var body: some View {
        ZStack {
            // 투두 셀 리스트
            VStack {
                if !todoListViewModel.todos.isEmpty {
                    CustomNavigationBar(
                        isDisplayLeftBtn: false,
                        rightBtnAction: {
                            todoListViewModel.navigationRightBtnTapped()
                        },
                        rightBtnType: todoListViewModel.navigationBarRightBtnMode
                    )
                } else {
                    // 네비게이션 바가 없으면 공백 대체
                    Spacer()
                        .frame(height: 30)
                }
                
                titleView
                titleView2()
            }
        }
    }
    
    // 1) 하위뷰 생성기 프로퍼티를 이용한 방법
    var titleView: some View {
        Text("Title")
    }
    
    // 2)
    func titleView2() -> some View {
        Text("Title")
    }
}

// 3)
//private struct TitleView3: View {
//    // @Environment . . .
//}

struct TodoListView_Previews: PreviewProvider {
  static var previews: some View {
      TodoListView()
          .environmentObject(PathModel())
          .environmentObject(TodoListViewModel())
  }
}
