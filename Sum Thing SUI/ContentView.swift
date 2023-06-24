//
//  ContentView.swift
//  Sum Thing SUI
//
//  Created by Pranav Chunchur on 27/05/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
<<<<<<< HEAD
    @EnvironmentObject var transactionListVM : TransactionListViewModel1
    //var demoData : [Double] = [7,18,15,25,14,12,27,12,22]
=======
>>>>>>> 7692dea6c15cf899ef04da3b1f280a448a886fa8
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 25){
                    Text("Summary")
                        .font(.title)
                        .bold()
                    
                    //Marker : Code for Line Chart begins
<<<<<<< HEAD
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
                    .background(Color.systemBackground )
=======
                   //linechart()
>>>>>>> 7692dea6c15cf899ef04da3b1f280a448a886fa8
                    
                    
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
            
            
            
        }
        .navigationViewStyle(.stack)
        .accentColor(.icon)
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
