//
//  AddTransactionView.swift
//  Sum Thing SUI
//
//  Created by Swayam on 24/06/23.
//

import SwiftUI

struct AddTransactionView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var amount: Int64 = 0
    @State private var comment = ""
    @State private var date = Date()
    @State private var id = UUID()
    @State private var selectedCategory = "Uncategorized"
        
    let categories = [
            Category.autoAndTransport,
            Category.billsAndUtilities,
            Category.entertainment,
            Category.feesAndCharges,
            Category.foodAndDining,
            Category.house,
            Category.income,
            Category.shopping,
            Category.transfer,
            Category.health,
            Category.subscriptions
        ]
    
    var body: some View {
        Form {
            Section {
                TextField(" Name ", text: $name)
                TextField(" Comment ", text: $comment)
                Slider(value:
                        Binding(get: { Double(amount)},
                                set: { newValue in amount = Int64(newValue)
                                    }), in: 0...10000, step: 1)
                Text("Amount: \(amount)")
                Spacer()
                DatePicker(" Date ", selection: $date, displayedComponents:
                            [.date]).datePickerStyle(.compact)
                DatePicker(" Time ", selection: $date, displayedComponents: [.hourAndMinute]).datePickerStyle(.compact)
                Picker("Category", selection: $selectedCategory) {
                                    ForEach(categories, id: \.id) { category in
                                        Text(category.name)
                                    }
                                }
                Text(" Tranaction Id: \(id.uuidString)")
                
                HStack {
                    Spacer()
                    Button(" Submit ") {
                        DataController().addTransaction(name: name, amount: amount, comment: comment, date: date, category: selectedCategory, transaction_id: id, context: managedObjectContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionView()
    }
}
