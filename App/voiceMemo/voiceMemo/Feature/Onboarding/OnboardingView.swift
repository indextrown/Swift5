//
//  OnboardingView.swift
//  voiceMemo
//

import SwiftUI

struct OnboardingView: View {
    // 처음 선언이라 StateObject로 선언해줌(온보딩뷰모델)
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    
    var body: some View {
        // TODO: - 화면 전환 구현 필요
        OnboardingContentView(onboardingViewModel: onboardingViewModel)
    }
}

// MARK: - 온보딩 컨텐츠 뷰
private struct OnboardingContentView: View {
    @ObservedObject private var onboardingViewModel: OnboardingViewModel
    
    // 상위뷰에서만 사용, 이파일내에서만 사용되서 private사용, 초기화 선언시 이 파일내에서만 사용하기 위해 fileprivate로 둠
    // 이게 private이면 OnboardingView에서 사용불가능해진다
    fileprivate init(onboardingViewModel: OnboardingViewModel) {
        self.onboardingViewModel = onboardingViewModel
    }
    
    fileprivate var body: some View {
        VStack {
            // 온보딩 셀리스트 뷰
            OnboardingCellListView(onboardingViewModel: onboardingViewModel)
            
            // 시작 버튼 뷰
        }
    }
}

// MARK: - 온보딩 셀리스트 뷰
private struct OnboardingCellListView: View {
    @ObservedObject private var onboardingViewModel: OnboardingViewModel
    @State private var selectedIndex: Int    // 배경 변화
    
    fileprivate init(
        onboardingViewModel: OnboardingViewModel,
        selectedIndex: Int = 0
    ) {
        self.onboardingViewModel = onboardingViewModel
        self.selectedIndex = selectedIndex
    }
    
    fileprivate var body: some View {
        TabView(selection: $selectedIndex) {
            // 온보딩 셀
            ForEach(Array(onboardingViewModel.onboardingContents.enumerated()), id: \.element) { index, onboardingContent in
                    OnboardingCellView(onboardingContent: onboardingContent)
                    .tag(index)
            }
        }
        // 탭뷰스타일: 페이지
        .tabViewStyle(.page(indexDisplayMode: .never))
        // 프레임은 전체적으로 꽉차게 -> 2/3
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.5)
        .background(
            // 짝수는 하늘색 홀수는 그린색
            selectedIndex % 2 == 0
            ? Color.customSky
            : Color.customBackgroundGreen
        )
        // 탭뷰로 인해 잘리는 부분이 존재 -> 과감히 절삭
        .clipped()
    }
}

// MARK: - 온보딩 셀 뷰
private struct OnboardingCellView: View {
    private var onboardingContent: OnboardingContent
    
    fileprivate init(
        onboardingContent: OnboardingContent
    ) {
        self.onboardingContent = onboardingContent
    }
    
    fileprivate var body: some View {
        VStack {
            Image(onboardingContent.imageFileName)
                .resizable()
                .scaledToFit()// 화면꽉차면서 비율유지
            
            HStack {
                Spacer()
                
                VStack {
                    Spacer()
                        .frame(height: 46)
                    
                    Text(onboardingContent.title)
                        .font(.system(size: 16, weight: .bold))
                    
                    Spacer()
                        .frame(height: 5)
                    
                    Text(onboardingContent.subTitle)
                        .font(.system(size: 16))
                }
                Spacer()
            }
            .background(Color.customWhite)
            .cornerRadius(0) // shadow를 위함
        }
        .shadow(radius: 10)
    }
}





struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
    OnboardingView()
    }
}
