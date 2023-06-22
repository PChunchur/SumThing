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


typealias TransactionGroup = [String : [Transaction ]]
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
    
}

