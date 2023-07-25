//
//  TabView.swift
//  Sum Thing SUI
//
//  Created by Swayam on 30/06/23.
//

import SwiftUI
import SwiftUICharts
import SwiftUIFontIcon

struct MainView: View {
    
    @EnvironmentObject var transactionListVM : TransactionListViewModel1
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15){
                Text("Summary")
                    .font(.title)
                    .bold()
                
                //Marker : Code for Line Chart begins
                let data = transactionListVM.getTransactions()
                let totalExpenses = data.last?.1 ?? 0
                
                CardView {
                    VStack(alignment: .leading){
                        ChartLabel(totalExpenses.formatted(.currency (code: "INR")), type: .title, format: "₹%0.2f")
                        
                        LineChart()
                        
                    }
                    .background(Color.systemBackground )
                }
                
                .data(data)
                .chartStyle((ChartStyle(backgroundColor: .icon,
                                        foregroundColor: ColorGradient(.blue, .purple))))
                .frame(height: 250)
                //.background(Color.icon )
                //linechart()
                
                
                // Marker for Recent transaction list
                // Sends user to The list of transactions being made
                
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
        
        
        .navigationViewStyle(.stack)
        .accentColor(.icon)
    }
    

        }
    


struct MainView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel1 = {
        let transactionListVM = TransactionListViewModel1()
        transactionListVM.transaction = transactionListPreviewData
        
        return transactionListVM
    }()
    static var previews: some View {
        Group{
            MainView()
            MainView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}

