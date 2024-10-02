//
//  MainView.swift
//  Haan
//
//  Created by Pat on 2/10/2567 BE.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Query var members: [Person]
    @Query var events: [PaymentEvent]
    
    //    @State private var groupBalance: Int =
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Haan").font(.title)
                    Text("\(members.reduce(0) { $0 + $1.balance} - events.reduce(0) {0 + $1.amount})").font(.largeTitle).bold()
                    
                    Spacer()
                    
                    // Bar chart
                    VStack {
                        Image("Logo").resizable().scaledToFit()
                    }
                    .foregroundStyle(.pink)
                    .scaledToFit()
                    
                    
                    Spacer()
                    
                    // Bottom Navbar
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: MemberView()) {
                            Text("Members").bold()
                        }
                        
                        
                        Spacer()
                        
                        
                        NavigationLink(destination: CreateEventView()) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .foregroundStyle(.green)
                        }
                        
                        
                        Spacer()
                        
                        NavigationLink(destination: HistoryView()) {
                            Text("History").bold()
                        }
                        
                        Spacer()
                    }
                    
                }.frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .top
                )
                
            } // VStack
            
            Image("Background").resizable().scaledToFit()
            
        }
    } // NavigationView
}

#Preview {
    MainView()
}
