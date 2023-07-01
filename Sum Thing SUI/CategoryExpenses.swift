//
//  CategoryExpenses.swift
//  Sum Thing SUI
//
//  Created by Pranav Chunchur on 26/06/23.
//

import SwiftUI

extension String: Identifiable {
    public var id: String { return self }
}

struct CategoryExpenses: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    let categories: [(String, Image)] = [
        ("Auto and Transport", Image(systemName: "car.fill")),
        ("Bills and Utilities", Image(systemName:"doc.fill")),
        ("Entertainment", Image(systemName:"tv.fill")),
        ("Fees and Charges", Image(systemName:"creditcard.fill")),
        ("Food and Dining", Image(systemName:"fork.knife")),
        ("House", Image(systemName:"house.fill")),
        ("Income", Image(systemName:"dollarsign.circle.fill")),
        ("Shopping", Image(systemName:"cart.fill")),
        ("Transfer", Image(systemName:"arrow.right.arrow.left.circle.fill")),
        ("Health", Image(systemName:"heart.fill")),
        ("Subscription", Image(systemName:"cart.badge.plus"))
    ]
    @State private var selectedCategory: String?
    
    var body: some View {
        VStack {
            List(categories,id: \.0) { category in
                Button(action: {
                    selectedCategory = category.0
                }) {
                    HStack {
                        category.1
                        Text(category.0)
                            .padding(.leading)
                        Spacer()
                    }
                }
            }
            .sheet(item: $selectedCategory, onDismiss: { selectedCategory = nil}) { category in SelectedCategoryView(category: category)
                    .environment(\.managedObjectContext, managedObjectContext)
            }
            Spacer()
        }
    }
}
struct CategoryExpenses_Previews: PreviewProvider {
    static var previews: some View {
        CategoryExpenses()
    }
}
