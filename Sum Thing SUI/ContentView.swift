//
//  ContentView.swift
//  Sum Thing SUI
//
//  Created by Pranav Chunchur on 27/05/23.
//

import SwiftUI
import SwiftUICharts
import SwiftUIFontIcon

struct ContentView: View {
    @EnvironmentObject var transactionListVM : TransactionListViewModel1
    //var demoData : [Double] = [7,18,15,25,14,12,27,12,22]
    var body: some View {
        NavigationView{
            TabView {
                MainView()
                    .tabItem {
                        Label("Summary", systemImage: "house.fill")
                    }
                AddTransactionView()
                    .tabItem {
                        Label("Input", systemImage: "tray.and.arrow.up.fill")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                CategoryExpenses()
                    .tabItem {
                        Label("Category", systemImage:"chart.bar.doc.horizontal")
                    }
            }
        }
    }
            
    
    
    struct ContentView_Previews: PreviewProvider {
        static let transactionListVM: TransactionListViewModel1 = {
            let transactionListVM = TransactionListViewModel1()
            transactionListVM.transaction = transactionListPreviewData
            
            return transactionListVM
        }()
        static var previews: some View {
            Group{
                ContentView()
                ContentView()
                    .preferredColorScheme(.dark)
            }
            .environmentObject(transactionListVM)
        }
    }
}
