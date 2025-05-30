//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Ryan Hangralim on 23/03/25.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
