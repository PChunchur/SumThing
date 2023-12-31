//
//  TransactionModel.swift
//  Sum Thing SUI
//
//  Created by Pranav Chunchur on 27/05/23.
//

import Foundation
import SwiftUIFontIcon
import SwiftUIFontIcon



struct Transaction: Identifiable, Decodable,Hashable{
    let id: Int
    let date: String
    let institution: String
    let account: String
    let merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    
    var categoryID:Int
    var category: String
    var isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited:Bool
    
    var icon: FontAwesomeCode{
        if let category = Category.all.first(where: {$0.id == categoryID}){
            return category.icon
            
        }
        return .question
    }
    var dateParsed : Date{
        date.dateParsed()
    }
    
    var signedAmt: Double{
        return type == TransactionType.credit.rawValue ? amount : -amount
    
    }
    var month : String{
        dateParsed.formatted(.dateTime.year().month(.abbreviated) )
    }
}

enum TransactionType: String{
    case debit = "Debit"
    case credit = "Credit"
}
struct Category: Hashable{
    let id : Int
    let name : String
    let icon : FontAwesomeCode
    var mainCategoryId: Int?
}
extension Category {
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: .car_alt)
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: .file_invoice_dollar)
    static let entertainment = Category(id: 3, name: "Entertainment", icon: .film)
    static let feesAndCharges = Category(id: 4, name:"Fees & Charges", icon: .hand_holding_usd)
    static let foodAndDining = Category(id: 5, name:"Food & Dining", icon: .hamburger)
    static let house = Category(id: 6, name: "Home", icon: .home)
    static let income = Category(id: 7, name: "Income", icon: .rupee_sign)
    static let shopping = Category(id: 8, name: "Shopping", icon: .shopping_cart)
    static let transfer = Category(id: 9, name: "Transfer", icon: .exchange_alt)
    static let health = Category(id: 10, name: "Health Care", icon: .hand_holding_medical)
    static let subscriptions = Category(id:11, name: "Subscriptions", icon: .bookmark)
    
    
    static let publicTransportation = Category(id: 101, name: "Public Transportation", icon: .bus, mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", icon: .mobile_alt, mainCategoryId: 2)
    static let moviesAndDVDs = Category(id: 301, name: "Movies & shows", icon: .film, mainCategoryId: 3)
    static let bankfee = Category(id: 401, name: "Bank Fee", icon: .hand_holding_usd, mainCategoryId: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", icon: .hand_holding_usd, mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries", icon: .shopping_basket, mainCategoryId: 5)
    static let restaurants = Category(id: 502, name: "Restaurants", icon: .utensils, mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent", icon: .house_user, mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", icon: .lightbulb, mainCategoryId: 6)
    static let paycheque = Category(id: 701, name: "Paycheque", icon: .rupee_sign, mainCategoryId: 7)
    static let software = Category(id: 801, name: "Software", icon: .icons, mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon: .exchange_alt, mainCategoryId: 9)
    static let dentist = Category(id: 1001, name: "Dentist", icon: .teeth, mainCategoryId: 10)
    static let hospital = Category(id: 1002, name: "Hospital", icon: .hospital, mainCategoryId: 10)
    static let eyecare = Category(id: 1003, name: "Eye care", icon: .eye_dropper, mainCategoryId: 10)
    //static let netflix = Category(id: 1101, name: "Netflix Subscription", icon: .netflix, mainCategoryId: 11 )
    static let apple = Category(id: 1102, name: "Apple Subscription", icon: .apple_pay, mainCategoryId: 11 )
  
    
    
    
    
    
    // dentist, hospital, eye care, clothes, electronics, subsciptions
     
}
extension Category{
    static let categories: [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .house,
        .income,
        .shopping,
        .transfer,
        .health,
        .subscriptions
        
    ]
    static let Subcategories: [Category] = [
     
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .bankfee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment,
        .dentist,
        .hospital,
        .eyecare,
        .apple
    ]
    static let all: [Category] = categories + Subcategories
}

