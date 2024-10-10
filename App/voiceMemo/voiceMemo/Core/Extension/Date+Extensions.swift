//
//  Date+Extensions.swift
//  voiceMemo
//

import Foundation

extension Date {
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")  // 한국
        formatter.dateFormat = "a hh:mm"  // 오전오후 몇시:몇분
        return formatter.string(from: self) // 현재 들어온 데이터값을 반환
    }
    
    var formattedDay: String {
        let now = Date()
        let calender = Calendar.current
        
        let nowStartOfDay = calender.startOfDay(for: now) // 현재부터 어느 날짜인지
        let dateStartDay = calender.startOfDay(for: self)  // 현재 들어온 날짜
        
        let numOfDaysDifference = calender.dateComponents([.day], from: nowStartOfDay, to: dateStartDay).day!
        
        if numOfDaysDifference == 0 {
            return "오늘"
        } else {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.dateFormat = "M월 d일 E요일"
            return formatter.string(from: self)
        }
    }
}
