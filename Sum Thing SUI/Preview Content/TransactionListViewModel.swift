//
//  TransactionListViewModel.swift
//  Sum Thing SUI
//
//  Created by Pranav Chunchur on 28/05/23.
//

// This model Notifies every user whenever their transaction list has been updated like a debited or credited amount


import Foundation
import Combine
import SwiftUI
import Collections


typealias TransactionGroup = OrderedDictionary<String, [Transaction ]>
typealias AllTransactionSum = [(String,Double)]
final class TransactionListViewModel1: ObservableObject{
    @Published var transaction: [Transaction] = []
    
    private var cancellables = Set<AnyCancellable> ()
    
    
    init(){
        getTransaction()
    }
    
    func getTransaction() {
        guard let url = URL(string:"https://designcode.io/data/transactions.json") else{
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap {(data, response)-> Data in
                guard let HTTP_Response = response as? HTTPURLResponse, HTTP_Response.statusCode == 200 else{
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self , decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink{ completion in
                switch completion {
                case.failure (_):
                    print("Error fetching Transactions")
                case.finished:
                    print("Finish Catching Transaction")
                }
            }receiveValue: { [weak self] result in
                self?.transaction = result
                
            }
            .store(in: &cancellables)
        
    }
     // Marker : Getting transations to be grouped/organised by month
    func groupTransactionsByMonth() -> TransactionGroup{
        guard !transaction.isEmpty else { return [:]}    // ensuring that the app doesnt crash if the transactions are empty 
        
        let GroupedTransactions = TransactionGroup (grouping: transaction) { $0.month }
        
        return GroupedTransactions
        
    }
    
    func getTransactions() -> AllTransactionSum {
            print("hi")// change the text
            guard !transaction.isEmpty else  { return []}
            
            let today = Date()    //can use current date in strings and .parsed date
            let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
            
            print("Date Interals",dateInterval)
            var sum: Double = .zero
            var cumulativeSum = AllTransactionSum()
            
            for date in stride(from: dateInterval.start, to: today, by:60*60*24){
                let dailyExpenses = transaction.filter{ $0.dateParsed == date && $0.isExpense}
                let dailyTotal = dailyExpenses.reduce(0){$0 - $1.signedAmt}
                sum += dailyTotal
                sum = sum.roundedTo2Digits()
                cumulativeSum.append( (date.formatted() , sum))
                print (date.formatted(), "dailyTotal:", dailyTotal, "sum:", sum)
                
            }
            
            return cumulativeSum
        }
        
    }
    


