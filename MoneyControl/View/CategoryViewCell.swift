//
//  CategoryViewCell.swift
//  MoneyControl
//
//  Created by Максим Боталов on 22.11.2022.
//

import SwiftUI

struct CategoryViewCell: View {
    
    @State var controlModel: ExpenseCategory
    
    var body: some View {
        VStack {
            Text(controlModel.image)
                .frame(minWidth: 50, minHeight: 50)
                .background(Color.gray.opacity(0.3))
                .clipShape(Circle())
            
            Text(controlModel.description)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundColor(.black)
        }
    }
}

struct CategoryViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryViewCell(controlModel: .auto)
            .previewLayout(.sizeThatFits)
    }
}
