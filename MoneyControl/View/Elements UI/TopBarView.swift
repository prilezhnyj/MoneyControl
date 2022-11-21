//
//  TopBarView.swift
//  MoneyControl
//
//  Created by Максим Боталов on 19.11.2022.
//

import SwiftUI

struct TopBarView: View {
    @ObservedObject var controlViewModel = ExpenseViewModel()
    
    var body: some View {
        HStack {
            // MARK: Текущая дата (День недели + дата)
            VStack(alignment: .leading) {
                Text(controlViewModel.getTitleWeekDay(for: controlViewModel.currentDay))
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                Text(controlViewModel.currentDay.formatted(date: .long, time: .omitted))
                    .font(.system(size: 16, weight: .regular, design: .default))
            }
            Spacer()
            Image("Avatar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50, alignment: .center)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 0)
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
            .previewLayout(.sizeThatFits)
    }
}
