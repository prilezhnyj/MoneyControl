//
//  MainView.swift
//  MoneyControl
//
//  Created by Максим Боталов on 19.11.2022.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var controlViewModel = ExpenseViewModel()
    @State var isPresentedNewExpense = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 16) {
                TopBarView()
                InfoWidget()
                Spacer()
                
                List(controlViewModel.mockData) { item in
                    Text(item.expenseCategory.description)
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    Button {
                        isPresentedNewExpense.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 28, weight: .regular, design: .rounded))
                    }
                    .frame(width: 70, height: 70)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .padding(30)
                    .shadow(color: .black.opacity(0.5), radius: 20, x: 0, y: 0)
                    .sheet(isPresented: $isPresentedNewExpense) {
                        NewOperationView()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
