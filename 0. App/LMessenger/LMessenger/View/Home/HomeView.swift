//
//  HomeView.swift
//  LMessenger
//
//  Created by 김동현 on 1/14/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        NavigationStack {
            ScrollView {
                profileView
                    .padding(.bottom, 30)
                
                searchButton
                    .padding(.bottom, 24)
                
                HStack {
                    Text("친구")
                        .font(.system(size: 14))
                        .foregroundColor(.bkText)
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
            }
            .toolbar {
                Image("bookmark")
                Image("notifications")
                Image("person_add")
                Button {
                    
                } label: {
                    Image("settings")
                }
            }
        }
    }
    
    // MARK: - 뷰를 프로퍼티로 만들기
    private var profileView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 7) {
                Text(viewModel.myUser?.name ?? "이름")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.bkText)
                Text(viewModel.myUser?.description ?? "상태 메시지 입력")
                    .font(.system(size: 12))
                    .foregroundColor(.greyDeep)
            }
            Spacer()
            
            Image("person")
                .frame(width: 52, height: 52)
                .clipShape(Circle())
        }
        .padding(.horizontal, 30)
    }
    
    // MARK: - 검색 버튼 뷰
    private var searchButton: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 36)
                .background(Color.greyCool)
                .cornerRadius(5)
            
            HStack {
                Text("검색")
                    .font(.system(size: 12))
                    .foregroundColor(.greyLightVer2)
                Spacer()
            }
            .padding(.leading, 22)
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
