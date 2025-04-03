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
    @Query var expenses: [ExpenseItem]
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundStyle(item.amount > 100000 ? .red : item.amount > 50000 ? .orange : .blue)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar{
                NavigationLink{
                    AddView()
                } label: {
                    Button("Add Expense", systemImage: "plus"){
            
                    }
                }
                
            }
        }
    }
    
    func removeItems(at offsets: IndexSet){
        for offset in offsets {
            let item = expenses[offset]
            modelContext.delete(item)
        }
    }
}

#Preview {
    ContentView()
}
