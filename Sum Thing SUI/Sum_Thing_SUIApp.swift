//
//  Sum_Thing_SUIApp.swift
//  Sum Thing SUI
//
//  Created by Pranav Chunchur on 27/05/23.
//

import SwiftUI

@main
struct Sum_Thing_SUIApp: App {
    @StateObject var TransactionsListVM = TransactionListViewModel1()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TransactionsListVM)
        }
    }
}
 
