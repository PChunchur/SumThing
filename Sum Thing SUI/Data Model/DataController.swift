//
//  DataController.swift
//  Sum Thing SUI
//
//  Created by Swayam on 23/06/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Input Transactions")
    
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

    func addTransaction(name: String, amount: Int64, comment: String, context: NSManagedObjectContext) {
        let transaction = TransactionEntity(context: context)
        transaction.amount = amount
        transaction.comment = comment
        transaction.date = Date()
        transaction.name = name
        transaction.transaction_id = UUID()
        
        save(context: context)
    }

    func editTransaction(transaction: TransactionEntity, comment: String, amount: Int64, context: NSManagedObjectContext) {
        transaction.date = Date()
        transaction.comment = comment
        transaction.amount = amount
        
        save(context: context)
    }
}
