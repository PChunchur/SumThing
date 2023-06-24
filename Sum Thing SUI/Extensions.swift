//
//  Extensions.swift
//  Sum Thing SUI
//
//  Created by Pranav Chunchur on 27/05/23.
//

import Foundation
import SwiftUI
extension Color {
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
    
    
    
}
extension DateFormatter{
    static let allNumericUK: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    } ()
    
}

extension String{
    func dateParsed() -> Date{
        guard let parsedDate = DateFormatter.allNumericUK.date(from: self) else{ return Date()}
        return parsedDate
    }
}

extension Date: Strideable {
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day() )
    }
    
}
extension Double {
    func roundedTo2Digits() -> Double {
        return (self * 100).rounded() / 100
    }
}
