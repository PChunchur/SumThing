//
//  TransactionList.swift
//  Sum Thing SUI
//
//  Created by Pranav Chunchur on 22/06/23.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var TransactionListVM : TransactionListViewModel1
    var body: some View {
        VStack{
            List{
                ForEach(Array(TransactionListVM.groupTransactionsByMonth().prefix(3)), id: \.key) {
                    month, transactions in
                    Section {
                        ForEach(transactions) {
                            transaction in
                            TransactionRow(transaction: transaction)
                            
                        }
                    } header: {
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                    
                }
                .listStyle(.plain)
                
            }
            .navigationTitle("Month Wise Transaction")
            .navigationBarTitleDisplayMode(.inline)
            
            
            
        }
    
        
    }
}

struct TransactionList_Previews: PreviewProvider {
   
    static let transactionListVM: TransactionListViewModel1 = {
        let transactionListVM = TransactionListViewModel1()
        transactionListVM.transaction = transactionListPreviewData
            
        return transactionListVM
    }()
    static var previews: some View {
        Group{
            NavigationView {
                TransactionList()
            }
            NavigationView {
                TransactionList()
                    .preferredColorScheme(.dark  )
            }
            
        }
        .environmentObject(transactionListVM)
        
    }
}
