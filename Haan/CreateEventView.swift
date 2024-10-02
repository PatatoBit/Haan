//
//  CreateEventView.swift
//  Haan
//
//  Created by Pat on 2/10/2567 BE.
//

import SwiftUI
import Combine

struct Person: Identifiable {
    var id = UUID()
    var name: String
    var balance: Int
}

struct CreateEventView: View {
    @State private var amount: String = ""
    @State private var name: String = ""
    @State private var selectedMembers: [String] = []
    
    @State private var selected: Bool = true
    
    var members: [Person] = [
        Person(name: "Pat", balance: 20),
        Person(name: "Boom", balance: 50)
    ]
    
    var body: some View {
        VStack {
            TextField("Amount", text: $amount)
                .font(.largeTitle)
                .keyboardType(.numberPad)
                .onReceive(Just(amount)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.amount = filtered
                    }
                }
            
            
            TextField("Note", text: $name)
            
            Button("Select All") {
                
            }
            
            List(members) { member in
                    Toggle(isOn: $selected) {
                        Text("\(member.name)")
                    }
            }
            
        }
        .padding( .top)
        .frame(maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    CreateEventView()
}
