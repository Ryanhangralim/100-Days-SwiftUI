//
//  ContentView.swift
//  iExpense
//
//  Created by Ryan Hangralim on 23/03/25.
//

import SwiftData
import SwiftUI


struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]
    
    @State private var showingAddExpense = false
    
    // Filter
    let filters = ["All", "Personal", "Business"]
    @State private var selectedFilter = "All"
    
    var body: some View {
        NavigationStack {
            VStack {
                // Filters
                Picker("Filter", selection: $selectedFilter) {
                    ForEach(filters, id: \.self) { filter in
                        Text(filter)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                ExpenseView(typeFilter: selectedFilter, sortOrder: sortOrder)
            }
            .navigationTitle("iExpense")
            .toolbar{
                NavigationLink{
                    AddView()
                } label: {
                    Button("Add Expense", systemImage: "plus"){ }
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down"){
                    Picker("Sort", selection: $sortOrder){
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\ExpenseItem.name),
                                SortDescriptor(\ExpenseItem.amount)
                            ])
                        
                        Text("Sort by Amount")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount),
                                SortDescriptor(\ExpenseItem.name)
                            ])
                    }
                }
            }
        }
    }
    
    
}

#Preview {
    ContentView()
}
