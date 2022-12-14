//
//  InfoWidget.swift
//  MoneyControl
//
//  Created by Максим Боталов on 19.11.2022.
//

import SwiftUI

struct InfoWidget: View {
    
    @ObservedObject var controlViewModel = ExpenseViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("За " + controlViewModel.getTitleMonth(for: controlViewModel.currentDay))
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                        Text("вы сэкономили")
                            .font(.system(size: 14, weight: .regular, design: .default))
                    }
                    Text("💰 1000000₽")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Заработали")
                            .font(.system(size: 14, weight: .regular, design: .default))
                        Text("1000000₽")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Потратили")
                            .font(.system(size: 14, weight: .regular, design: .default))
                        Text("1000000₽")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                    }
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .frame(height: 5)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.linearGradient(Gradient(colors: [.red, .green]), startPoint: .leading, endPoint: .trailing))
                
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .frame(width: 5, height: 16, alignment: .center)
                    .foregroundColor(.black)
                    .offset(x: 50)
            }
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
        .padding(.horizontal, 16)
    }
}

struct InfoWidgetMainView_Previews: PreviewProvider {
    static var previews: some View {
        InfoWidget()
            .previewLayout(.sizeThatFits)
    }
}
