//
//  BookKeep.swift
//  Sum Thing SUI
//
//  Created by Pranav Chunchur on 27/05/23.
//

import Foundation



struct bookKeeping: Identifiable{
    var id: ObjectIdentifier
    
    let borrowed: String
    let lent: String
    var borrowedAmount: Int
    var lentAmount: Int
}

