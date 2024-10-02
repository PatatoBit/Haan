//
//  Types.swift
//  Haan
//
//  Created by Pat on 2/10/2567 BE.
//

import Foundation
import SwiftData

@Model class Person: Identifiable {
    var id = UUID()
    var name: String
    var balance: Int
    
    init(id: UUID = UUID(), name: String, balance: Int) {
        self.id = id
        self.name = name
        self.balance = balance
    }
}

@Model class PaymentEvent: Identifiable {
    var id = UUID()
    
    var amount: Int
    var name: String
    var createdAt: Date
    
    init(id: UUID = UUID(), amount: Int, name: String, createdAt: Date) {
        self.id = id
        self.amount = amount
        self.name = name
        self.createdAt = createdAt
    }
}
