//
//  ContentView.swift
//  HabitTracker
//
//  Created by Ryan Hangralim on 29/03/25.
//

import SwiftUI

struct HabitItem: Identifiable, Codable {
    var id = UUID()
    let type: String
    let description: String
    let date: Date
    let duration: Int
}

struct HabitType: Identifiable, Codable {
    var id = UUID()
    let name: String
}

@Observable
class Habits{
    var items = [HabitItem](){
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    var types = [HabitType]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(types) {
                UserDefaults.standard.set(encoded, forKey: "Types")
            }
        }
    }
    
    init() {
            if let savedItems = UserDefaults.standard.data(forKey: "Items") {
                if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedItems) {
                    items = decodedItems
                }
            }
            
            if let savedTypes = UserDefaults.standard.data(forKey: "Types") {
                if let decodedTypes = try? JSONDecoder().decode([HabitType].self, from: savedTypes) {
                    types = decodedTypes
                }
            }
        }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Hello World")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: Text("Add activity view")) {
                        Label("Add Activity", systemImage: "plus")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading){
                    NavigationLink(destination: Text("View Habits")) {
                        Text("View Habits")
                    }
                }
            }
            .navigationTitle("Habit Tracker")
        }
    }
}

#Preview {
    ContentView()
}
