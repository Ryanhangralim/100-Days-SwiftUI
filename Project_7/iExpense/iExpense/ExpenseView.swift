//
//  ExpenseView.swift
//  iExpense
//
//  Created by Ryan Hangralim on 03/04/25.
//

import SwiftData
import SwiftUI

struct ExpenseView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    var body: some View {
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
    }
    
    init(typeFilter: String, sortOrder: [SortDescriptor<ExpenseItem>]){
        
        var predicate: Predicate<ExpenseItem>? {
            if typeFilter == "All" {
                return nil // no filter/ return all
            } else {
                return #Predicate<ExpenseItem> { $0.type == typeFilter }
            }
        }
        
        _expenses = Query(filter: predicate ,sort: sortOrder)
    }
    
    func removeItems(at offsets: IndexSet){
        for offset in offsets {
            let item = expenses[offset]
            modelContext.delete(item)
        }
    }
}

#Preview {
    ExpenseView(typeFilter: "All", sortOrder: [SortDescriptor(\ExpenseItem.name)])
}
