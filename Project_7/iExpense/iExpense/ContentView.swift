//
//  ContentView.swift
//  iExpense
//
//  Created by Ryan Hangralim on 23/03/25.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses{
    var items = [ExpenseItem](){
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}


struct ContentView: View {
    @State private var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items, id: \.id) { item in
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
                    (AddView(expenses: expenses))
//                Button("Add Expense", systemImage: "plus") {
//                    showingAddExpense = true
                } label: {
                    Button("Add Expense", systemImage: "plus"){
            
                    }
                }
                
            }
//            .sheet(isPresented: $showingAddExpense){
//                AddView(expenses: expenses)
//            }
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
