//
//  ControlViewModel.swift
//  MoneyControl
//
//  Created by Максим Боталов on 19.11.2022.
//

import Foundation

class ExpenseViewModel: ObservableObject {
    
    @Published var mockData = [ExpenseModel]()
    @Published var currentDay = Date()
    @Published var currentWeek = [Date]()
    @Published var currentMonth = [Date]()
    
    private let calendar = Calendar.current
    
    init() {
        getCurrentWeek()
    }
    
    // MARK: - Получение текущей даты
    func getCurrentDate(for date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    // MARK: - Получение текущей недели
    func getCurrentWeek() {
        let today = Date()
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstDayWeek = week?.start else { return }
        
        (1...7).forEach { day in
            if let weekDay = calendar.date(byAdding: .day, value: day, to: firstDayWeek) {
                currentWeek.append(weekDay)
            }
        }
    }
    
    // MARK: - Получение названия дня недели по дате
    func getTitleWeekDay(for date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let weekDay = dateFormatter.string(from: date).capitalized
        return weekDay
    }
    
    // MARK: - Получение названия месяца для виджета
    func getTitleMonth(for date: Date) -> String {
        let components = calendar.dateComponents([.month], from: date)
        let month = components.month!
        
        let result: String
        
        switch month {
            case 1: result = "январь"
            case 2: result = "февраль"
            case 3: result = "март"
            case 4: result = "апрель"
            case 5: result = "май"
            case 6: result = "июнь"
            case 7: result = "июль"
            case 8: result = "август"
            case 9: result = "сентябрь"
            case 10: result = "октябрь"
            case 11: result = "ноябрь"
            default: result = "декабрь"
        }
        return result
    }
}
