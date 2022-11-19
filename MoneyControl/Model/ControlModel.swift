//
//  ControlModel.swift
//  MoneyControl
//
//  Created by Максим Боталов on 19.11.2022.
//

import Foundation

// MARK: - Model
struct ControlModel: Identifiable {
    var id = UUID().uuidString
    var expenseCategory: ExpenseCategory?
    var incomeCategory: IncomeCategory?
    var accoutn: Account?
    var type: TypeOperation
    var amount: Double
    var date: Date
}


// MARK: - Expense Category
enum ExpenseCategory: String {
    case products
    case home
    case sweets
    case cafe
    case fun
    case shop
    case taxi
    case auto
    case pharmacy
    case present
    case education
    case trip
    case penalties
    case hobby
    case transport
}

extension ExpenseCategory {
    var description: String {
        switch self {
        case .products:
            return "Продукты"
        case .home:
            return "Дом"
        case .sweets:
            return "Сладости"
        case .cafe:
            return "Кафе"
        case .fun:
            return "Развлечения"
        case .shop:
            return "Покупки"
        case .taxi:
            return "Такси"
        case .auto:
            return "Авто"
        case .pharmacy:
            return "Аптека"
        case .present:
            return "Подарки"
        case .education:
            return "Образование"
        case .trip:
            return "Путешествия"
        case .penalties:
            return "Штрафы"
        case .hobby:
            return "Хобби"
        case .transport:
            return "Транспорт"
        }
    }
    
    var image: String {
        switch self {
        case .products:
            return "🥬"
        case .home:
            return "🏠"
        case .sweets:
            return "🍭"
        case .cafe:
            return "☕️"
        case .fun:
            return "🎡"
        case .shop:
            return "🛍"
        case .taxi:
            return "🚕"
        case .auto:
            return "🚗"
        case .pharmacy:
            return "💊"
        case .present:
            return "🎁"
        case .education:
            return "📚"
        case .trip:
            return "🏕"
        case .penalties:
            return "🚨"
        case .hobby:
            return "⚽️"
        case .transport:
            return "🚎"
        }
    }
}


// MARK: - Income Category
enum IncomeCategory {
    case wages
    case passiveIncome
}

extension IncomeCategory {
    var description: String {
        switch self {
        case .wages:
            return "Зарплата"
        case .passiveIncome:
            return "Пассивный доход"
        }
    }
}


// MARK: - Account type
enum Account {
    case main
    case personal
}

extension Account {
    var description: String {
        switch self {
        case .main:
            return "Основной"
        case .personal:
            return "Личный"
        }
    }
}


// MARK: - Type Operation
enum TypeOperation {
    case expense
    case income
}
    
    
    
    
    
    
    
    
