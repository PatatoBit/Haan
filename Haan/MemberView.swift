//  MemberView.swift
//  Haan
//
//  Created by admin3 on 2/10/2567 BE.
//

import SwiftUI
import SwiftData
import Combine

struct MemberView: View {
    @Environment(\.modelContext) var modelContext
    @Query var members: [Person]
    
    @State private var addalert = false
    @State private var payalert = false
    @State private var showaddmember = false
    
    @State private var amount = ""
    @State private var newname = ""
    
    private func addMember() {
        let newMember = Person(name: newname, balance: 0)
        modelContext.insert(newMember)
    }
    
    private func resetMember() {
        do {
            try modelContext.delete(model: Person.self)
        } catch {
            print("Failed to delete students.")
        }
    }
    
    var body: some View {
        Spacer()
        HStack {
            Spacer()
            Button(action : {showaddmember=true},label:{
                Image(systemName: "plus.circle.fill")
                    .padding(.trailing,30)
                    .font(.system(size: 35))
            })
            
            .alert("Add Member", isPresented: $showaddmember){
                TextField("Name",text: $newname)
                Button("Cancel",role: .cancel){}
                Button("Confirm"){
                    addMember()
                }
                .foregroundStyle(.blue)
                .font(.system(size: 35,weight: .bold,design: .serif))
                .padding(.trailing,20)
            }
            
        }//Hstack
        
        Text("Members")
            .font(.system(size: 30,weight: .bold,design: .serif))
        HStack {
            Text("Names")
                .padding(.leading,40)
            Spacer()
            Text("Balance")
                .padding(.trailing,70)
        } //Hstack
        
        List(members) {member in
            @Bindable var member = member
            HStack{
                Text("\(member.name)")
                
                Spacer()
                
                TextField("\(member.balance)", text: Binding(
                    get: { String(member.balance) },
                    set: { member.balance = Int($0) ?? 0 })
                )
                
            }//HStack
            .frame(maxWidth: .infinity)
            
        }
        
        Button("Reset Member") {
            resetMember()
        }
    }
    
}

#Preview {
    MemberView()
}
