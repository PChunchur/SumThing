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
        VStack( spacing: 20) {
            Text("Transactions for \(category)")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            List {
                ForEach(filteredTransactions, id: \.self) { transaction in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(transaction.name ?? "")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text("Amount: \(transaction.amount)")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .listStyle(GroupedListStyle())
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .navigationBarTitle("Category Details", displayMode: .inline)
    }
    var filteredTransactions: [TransactionEntity] {
        transactions.filter { $0.category == category }
    }
}

struct SelectedCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        let context = DataController().container.viewContext
        let transaction1 = TransactionEntity(context: context)
        transaction1.name = "Sample Transaction 1"
        transaction1.amount = 1000
        transaction1.category = "Food and Dining"
        let transaction2 = TransactionEntity(context: context)
        transaction2.name = "Sample Transaction 2"
        transaction2.amount = 500
        transaction2.category = "Food and Dining"
        return SelectedCategoryView(category: "Food and Dining")
            .environment(\.managedObjectContext, context)
    }
}

