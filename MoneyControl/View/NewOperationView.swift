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
    @State private var showCategory = false
    @State private var textForTextEditor = ""
    
    
    
    @ObservedObject var controlViewModel = ExpenseViewModel()
    
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Новый расход")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
            
            HStack(alignment: .center, spacing: 8) {
                Button {
                    //
                } label: {
                    Text("Расход")
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .foregroundColor(.black)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
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
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .clipShape(Capsule(style: .continuous))
                        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 5)
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 8)
            
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
                .padding(.bottom, 8)
            
            VStack(spacing: 0) {
                HStack {
                    Text("Категории")
                        .font(.system(size: 16, weight: .semibold, design: .default))
                    
                    Spacer()
                    
                    Button(showCategory ? "Скрыть" : "Показать") {
                        showCategory.toggle()
                    }
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))], alignment: .center, spacing: 30) {
                        ForEach(ExpenseCategory.allCases, id: \.self) { item in
                            Button {
                                category = item
                            } label: {
                                CategoryViewCell(controlModel: item)
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                
                Spacer()
            }
            .frame(height: showCategory ? 400 : 190)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding(.horizontal, 16)
            .padding(.bottom, 8)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.5), value: showCategory)
            
            
            VStack(spacing: 0) {
                HStack {
                    Text("Тип счёта")
                        .font(.system(size: 16, weight: .semibold, design: .default))
                    
                    Spacer()
                    
//                    Button(showCategory ? "Скрыть" : "Показать") {
//                        showCategory.toggle()
//                    }
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                
                HStack(alignment: .center, spacing: 8) {
                    ForEach(Account.allCases, id: \.self) { item in
                        Button {
                            account = item
                        } label: {
                            Text(item.description)
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                .foregroundColor(.black)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 8)
                                .background(Color.white)
                                .clipShape(Capsule(style: .continuous))
                                .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 5)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 16)
                .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.5), value: showCategory)
                
                Spacer()
            }
            .frame(height: 120)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding(.horizontal, 16)
            .padding(.bottom, 8)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.5), value: showCategory)
            
            ZStack {
                
                
                TextEditor(text: $description)
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.white)
                
                Text("Описание заметки (опицонально)")
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    .foregroundColor(description == "" ? .gray : .clear)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding(.horizontal, 16)
            .padding(.bottom, 8)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.5), value: showCategory)
            
            Button {
                saveNewExpense(category: category, account: account, amount: amount, description: description)
            } label: {
                Text("Сохранить")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .padding(.horizontal, 16)
            }
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.5), value: showCategory)
            .padding(.bottom, 16)

            
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
