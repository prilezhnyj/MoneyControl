//
//  NewOperationView.swift
//  MoneyControl
//
//  Created by Максим Боталов on 19.11.2022.
//

import SwiftUI

struct NewOperationView: View {
    
    @State var sel = 0
    @State var amountTextField = ""
    @State var controlModel: ControlModel!
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Новая покупка")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 16)
            
            List {
                Section {
                    Picker("Категория", selection: $sel) {
                        ForEach(ExpenseCategory.self.allCases, id: \.self) { index in
                            Text(index.description)
                        }
                    }
                } footer: {
                    Text("Выберите категорию своей траты. В будущем у вас будет возможность изменить её.")
                }
                
                Section {
                    Picker("Кошелёк", selection: $sel) {
                        ForEach(Account.self.allCases, id: \.self) { index in
                            Text(index.description)
                        }
                    }
                } footer: {
                    Text("Выберите тип вашего счёта. В будущем у вас будет возможность изменить её.")
                }
                
                Section {
                    TextField("Начните ввод", text: $amountTextField)
                        .keyboardType(.numberPad)
                } footer: {
                    Text("Вветите сумму, которую потратили. В будущем у вас не будет возможность изменить её.")
                }
            }
            .cornerRadius(20)
            .padding(16)
            
            Spacer()
            
            Button("Сохранить") {
                //
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding(16)
            
            Spacer()
        }
    }
}


struct NewOperationView_Previews: PreviewProvider {
    static var previews: some View {
        NewOperationView()
    }
}
