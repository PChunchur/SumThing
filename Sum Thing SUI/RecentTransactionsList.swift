//
//  RecentTransactionsList.swift
//  Sum Thing SUI
//
//  Created by Pranav Chunchur on 31/05/23.
//

import SwiftUI

struct RecentTransactionsList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel1
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5){
            HStack{
                Text("Recent Transactions")
                    .bold()
                    .font(.title2)
                    .padding(.init(top:0 , leading:0,bottom:10, trailing: 0))
                    .frame(maxWidth: .infinity)
                
               
                
                
                NavigationLink{
                    TransactionList()
                    
                }label:{
                    HStack(spacing: 4){
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                }   .foregroundColor(Color.icon)
                    .padding(.init(top: 0, leading: 0, bottom:20, trailing: 20))
                
            }
            // MArker for Each recent transaction list
            ForEach(Array(transactionListVM.transaction.prefix(5))) {  transactions in
                TransactionRow(transaction: transactions)
                Divider()
                
                    
            }
            
            
        }
        .padding(.top)
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.3), radius: 5, x: 0,y: 5)
    }
    
    struct RecentTransactionsList_Previews: PreviewProvider {
        static let transactionListVM: TransactionListViewModel1 = {
            let transactionListVM = TransactionListViewModel1()
            transactionListVM.transaction = transactionListPreviewData
            
            return transactionListVM
        }()
       
        static var previews: some View {
            Group{
                RecentTransactionsList()
                RecentTransactionsList()
                .preferredColorScheme(.dark)
                
            }
            .environmentObject(transactionListVM)
        }
    }
}

