//
//  HaanApp.swift
//  Haan
//
//  Created by Pat on 2/10/2567 BE.
//

import SwiftUI

@main
struct HaanApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: [Person.self, PaymentEvent.self])
    }
}

