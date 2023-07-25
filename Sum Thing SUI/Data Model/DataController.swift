//
//  DataController.swift
//  Sum Thing SUI
//
//  Created by Swayam on 23/06/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "InputTransactions")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load Data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved!!!")
        } catch {
            print("Failed to save context: \(error)")
        }
    }

    func addTransaction(name: String, amount: Int64, comment: String, date: Date,category: String,transaction_id: String, context: NSManagedObjectContext) {
        let transaction = TransactionEntity(context: context)
        transaction.amount = amount
        transaction.comment = comment
        transaction.date = date
        transaction.name = name
        transaction.category = category
        transaction.transaction_id = transaction_id
        
        save(context: context)
    }

    func editTransaction(transaction: TransactionEntity, comment: String, amount: Int64, date: Date, context: NSManagedObjectContext) {
        transaction.date = date
        transaction.comment = comment
        transaction.amount = amount
        
        save(context: context)
    }
}
