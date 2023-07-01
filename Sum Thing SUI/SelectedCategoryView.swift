//
//  SelectedCategoryView.swift
//  Sum Thing SUI
//
//  Created by Swayam on 01/07/23.
//

import SwiftUI

struct SelectedCategoryView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: TransactionEntity.entity(), sortDescriptors: []) var transactions: FetchedResults<TransactionEntity>
    var category: String
    
    var body: some View {
        VStack {
            Text("Transactions for \(category)")
                .font(.title)
                .padding()
            
            List {
                ForEach(filteredTransactions, id: \.self) { transaction in
                    Text(transaction.name ?? "")
                    Text("Amount: \(transaction.amount)")
                }
            }
        }
    }
    
    var filteredTransactions: [TransactionEntity] {
        transactions.filter { $0.category == category }
    }
}

struct SelectedCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        let context = DataController().container.viewContext
        let transaction = TransactionEntity(context: context)
        transaction.name = "Sample Transaction"
        transaction.amount = 1000
        transaction.category = "Food and Dining"
        
        return SelectedCategoryView(category: "Food and Dining")
            .environment(\.managedObjectContext, context)
    }
}

