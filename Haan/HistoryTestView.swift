//
//  HistoryTestView.swift
//  Haan
//
//  Created by Pat on 2/10/2567 BE.
//

import SwiftUI

struct Event: Identifiable {
    var id = UUID()
    var name: String
    var amount: Int
    var createdAt: String
}

struct HistoryTestView: View {
    @State private var events: [Event]  = [
        Event(name: "Bowling", amount: 20, createdAt: " "),
        Event(name: "Party", amount: 20, createdAt: " ")
    ]
    
    var body: some View {
        List(events) { event in
            Text("\(event.name)")
            Text("\(event.amount)")
            Text("\(event.createdAt)")
        }
    }
}

#Preview {
    HistoryTestView()
}
