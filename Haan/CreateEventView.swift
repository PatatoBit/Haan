//
//  CreateEventView.swift
//  Haan
//
//  Created by Pat on 2/10/2567 BE.
//

import SwiftUI
import SwiftData
import Combine

struct CreateEventView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var members: [Person]
    
    @State private var amount: String = ""
    @State private var name: String = ""
    @State private var selectedMembers: [String] = []
    
    @State private var selected: Bool = true // Change this
    
    private func createEvent() {
        let newEvent = PaymentEvent(
            amount: Int(self.amount)!,
            name: self.name,
            createdAt: Date()
        )
        
        modelContext.insert(newEvent)
        print("Sucess")
    }
    
    
    var body: some View {
        VStack {
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
                    selectedMembers = members.map { $0.name }
                }
            } .padding(.horizontal)
            
            
            
            
            List(members) { member in
                Toggle(isOn: Binding(
                    get: {
                        selectedMembers.contains(member.name)
                    },
                    set: { isSelected in
                        if isSelected {
                            selectedMembers.append(member.name)
                        } else {
                            selectedMembers.removeAll { $0 == member.name }
                        }
                    }
                )) {
                    Text("\(member.name)")
                }
            } // List
            .listStyle(.plain)
            
            Button("Create"){
                createEvent()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding( .top)
        .frame(maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    CreateEventView()
}
