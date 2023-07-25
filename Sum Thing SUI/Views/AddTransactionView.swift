//
//  AddTransactionView.swift
//  Sum Thing SUI
//
//  Created by Swayam on 24/06/23.
//

import SwiftUI

struct AddTransactionView: View {
    @Environment(\.managedObjectContext) private var managedObjectContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""
    @State private var amount: Int64 = 0
    @State private var comment = ""
    @State private var date = Date()
    @State private var id = ""
    @State private var selectedCategory = "Uncategorized"
    @State private var isCategorySelected = false
    @State private var messagePopup = false
    
    let categories = [
        "Auto and Transport",
        "Bills and Utilities",
        "Entertainment",
        "Fees and Charges",
        "Food and Dining",
        "House",
        "Income",
        "Shopping",
        "Transfer",
        "Health",
        "Subscriptions"
    ]
    
    var isFormValid: Bool {
        // You can add your validation logic here
        return true
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Amount", value: $amount, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                Section {
                    TextField("Comment", text: $comment)
                }
                Section {
                    DatePicker("Date", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(.compact)
                    DatePicker("Time", selection: $date, displayedComponents: [.hourAndMinute])
                        .datePickerStyle(.compact)
                }
                Section {
                    Picker("Category", selection: $selectedCategory) {
                        Text("No Option").tag(nil as String?)
                        ForEach(categories, id: \.self) {
                            Text($0).tag($0 as String?)
                        }
                    }
                }
                
                    TextField("Transaction Id", text: $id)
                    
                    HStack {
                        Spacer()
                        Button("Submit") {
                            withAnimation {
                                addTransaction()
                                messagePopup = true
                            }
                        }
                        Spacer()
                    }
                }
                .navigationTitle("Add Transaction")
                
                .navigationBarItems(trailing: Button("Cancel") {
                    dismiss()
                })
                .alert(isPresented: $messagePopup) {
                    Alert(
                        title: Text("Transaction Added"),
                        message: Text("Your Transaction has been added successfully"),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
    
    
    private func addTransaction() {
        let newTransaction = TransactionEntity(context: managedObjectContext)
        newTransaction.name = name
        newTransaction.amount = amount
        newTransaction.comment = comment
        newTransaction.date = date
        newTransaction.category = selectedCategory
        newTransaction.transaction_id = id
        
        do {
            try managedObjectContext.save()
        } catch {
            // Handle the error appropriately
            print("Error saving transaction: \(error)")
        }
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionView()
    }
}
