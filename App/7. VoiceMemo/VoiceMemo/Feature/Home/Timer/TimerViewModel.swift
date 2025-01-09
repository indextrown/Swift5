//
//  TimerViewModel.swift
//  VoiceMemo
//
//  Created by 김동현 on 1/9/25.
//

import Foundation

final class TimerViewModel: ObservableObject {
    @Published var isDisplaySetTimeView: Bool
    @Published var time: Time
    @Published var timer: Timer?
    @Published var timeRemaining: Int
    @Published var isPaused: Bool
    
    init(
        isDisplaySetTimeView: Bool = true,                      // 처음에는 세팅화면
        time: Time = .init(hours: 0, minutes: 0, seconds: 0),   // 처음에는 0:0:0
        timer: Timer? = nil,                                    // 타이머
        timeRemaining: Int = 0,                                 // 남은시간
        isPaused: Bool = false                                  // 일시정지
    ) {
        self.isDisplaySetTimeView = isDisplaySetTimeView
        self.time = time
        self.timer = timer
        self.timeRemaining = timeRemaining
        self.isPaused = isPaused
    }
}

// MARK: - 비즈니스 로직
extension TimerViewModel {
    // 설정하기 버튼 액션
    func settingBtnTapped() {
        isDisplaySetTimeView = false
        timeRemaining = time.convertedSeconds
        // MARK: - 타이머 시작 메서드 호출!
        startTimer()
    }
    
    // 진행중인 타이머 취소하는 버튼 액션
    func cancelBtnTapped() {
        // MARK: - 타이머 종료 메서드 호출!
        stopTimer()
        isDisplaySetTimeView = true
    }
    
    // 일시정지 & 일시정지에서 재개하는 버튼 액션
    func pauseOrRestartBtnTapped() {
        if isPaused {
            // MARK: - 타이머 시작 메서드 호출
            startTimer()
        } else {
            // 타이머가 동작중이라면 무효화 시켜준다
            timer?.invalidate()
            timer = nil
        }
        isPaused.toggle()
    }
}

// MARK: - 타이머 시작/종료메서드는 viewModel내부에서 호출되므로 private 사용
private extension TimerViewModel {
    func startTimer() {
        guard timer == nil else { return }
        
        timer = Timer.scheduledTimer(
            withTimeInterval: 1, // 1초마다 타이머 변경
            repeats: true        // 반복 허용
        ){ _ in
             
            // 시간이 남아으면
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                // MARK: - 타이머 종료 메서드 호출!
                self.stopTimer()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
