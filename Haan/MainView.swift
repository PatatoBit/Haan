//
//  MainView.swift
//  Haan
//
//  Created by Pat on 2/10/2567 BE.
//

import SwiftUI

struct MainView: View {
    @State private var groupBalance: Int = 2196
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Haan").font(.title)
                Text("\(groupBalance)").font(.largeTitle).bold()
                
                Spacer()
                
                // Bar chart
                VStack {
                    
                }
                .foregroundStyle(.pink)
                .scaledToFit()
                
                
                Spacer()
                
                // Bottom Navbar
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: MemberTestView()) {
                        Text("สมาชิก").bold()
                    }
                    
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: CreateEventView()) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .foregroundStyle(.green)
                    }

                                        
                    Spacer()
                    
                    NavigationLink(destination: HistoryTestView()) {
                        Text("ประวัติ").bold()
                    }

                    Spacer()
                }
                
            }.frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .top
            )
            
        } // VStack
    } // NavigationView
}

#Preview {
    MainView()
}
