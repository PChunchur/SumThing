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

    
}
