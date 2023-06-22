//
//  TransactionRow.swift
//  Sum Thing SUI
//
//  Created by Pranav Chunchur on 27/05/23.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View{
    
    
    var transaction : Transaction
    
    var body: some View {

            VStack(alignment: .leading, spacing: 1){
                
                //Marker : This will be for the heading od the Transaction Merchant
                HStack(spacing: 20){
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill (Color.icon.opacity(1))
                        .frame(width: 45, height: 45)
                        
                        .overlay{
                            FontIcon.text(.awesome5Solid(code: transaction.icon), fontsize: 20, color: Color.background)
                        }
                        .padding()
                    VStack(alignment: .leading, spacing: 5){
                    Text(transaction.merchant)
                        .font(.subheadline)
                        .bold()
                        .lineLimit(2)
                    
                    // Marker: This wll be the Category of the transaction
                    Text(transaction.category)
                        .font(.callout)
                        .opacity(0.8)
                        .lineLimit(1)
                    
                    // Marker: This wll be the DATE of the transaction
                    Text(transaction.dateParsed, format: .dateTime.year().month().day())
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                Spacer()
                //Marker Trasaction Code is essentially the country of origin of the currency like USD, GBP, INR etc.
                Text(transaction.amount, format: .currency(code: "INR"))
                    .font(.footnote)
                    .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text : .primary)
                    .padding(10)
                
            }
            .padding([.top, .bottom], 10)
        }
    }
}
struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            TransactionRow(transaction: TransactionPreviewData)
            TransactionRow(transaction: TransactionPreviewData)
                .preferredColorScheme(.dark)
        }
        
    }
}
