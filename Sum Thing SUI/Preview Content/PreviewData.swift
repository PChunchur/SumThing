//
//  PreviewData.swift
//  Sum Thing SUI
//
//  Created by Pranav Chunchur on 27/05/23.
//

import Foundation
var TransactionPreviewData = Transaction(id: 1, date: "05/28/2023", institution: "VIt", account: "Pranav", merchant: "Debjyoti", amount: 500, type: "credit", categoryID: 0001, category: "Cuz BEEBS", isPending: false, isTransfer: false, isExpense: false, isEdited: false)


var transactionListPreviewData = [Transaction](repeating: TransactionPreviewData, count: 10)
