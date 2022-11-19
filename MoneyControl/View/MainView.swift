//
//  MainView.swift
//  MoneyControl
//
//  Created by Максим Боталов on 19.11.2022.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var controlViewModel = ControlViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            TopBarView()
            InfoWidget()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
