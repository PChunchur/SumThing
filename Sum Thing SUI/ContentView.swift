//
//  ContentView.swift
//  Sum Thing SUI
//
//  Created by Pranav Chunchur on 27/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 25){
                    Text("Summary")
                        .font(.title)
                        .bold()
                    
                    // Marker for Recent transaction list
                    RecentTransactionsList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                
                // MARKER : Notification ICON
                
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                        .padding()
                        .frame(width: 25, height: 50, alignment: .trailing)
                    
                }
            }
            
            
            
        }
        .navigationViewStyle(.stack)
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