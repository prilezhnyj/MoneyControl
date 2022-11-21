//
//  NewOperationView.swift
//  MoneyControl
//
//  Created by Максим Боталов on 19.11.2022.
//

import SwiftUI

struct NewOperationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var category: ExpenseCategory = .products
    @State private var account: Account = .main
    @State private var amount = ""
    @State private var description = ""
    @State private var controlModel: ExpenseModel!
    @State private var pickerSection = 0
    
    @ObservedObject var controlViewModel = ExpenseViewModel()
    
    private let withScreen = UIScreen.main.bounds.width - 32
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Новый расход")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity)
            
            HStack(alignment: .center, spacing: 8) {
                Button {
                    //
                } label: {
                    Text("Расход")
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .foregroundColor(.black)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .clipShape(Capsule(style: .continuous))
                        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 5)
                }
                Button {
                    //
                } label: {
                    Text("Расход")
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .foregroundColor(.black)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .clipShape(Capsule(style: .continuous))
                        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 5)
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            
            TextField("Сумма", text: $amount)
                .keyboardType(.numberPad)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding(.horizontal, 16)
                .textFieldStyle(.plain)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(Color.gray.opacity(0.2))
                .clipShape(Capsule(style: .continuous))
                .padding(.horizontal, 16)
            
            Spacer()
        }
    }
    
    func saveNewExpense(category: ExpenseCategory, account: Account, amount: String, description: String) {
        if Double(amount) != nil {
            controlViewModel.mockData.append(ExpenseModel(expenseCategory: category, expenseDescription: description, accoutn: account, amount: Double(amount)!, date: Date()))
            print(controlViewModel.mockData)
        } else {
            print("ERROR")
        }
    }
    
    func amountIsEmpty(amountTextField: String) -> Bool {
        guard amountTextField != "" else { return true }
        return false
    }
}


struct NewOperationView_Previews: PreviewProvider {
    static var previews: some View {
        NewOperationView()
    }
}
