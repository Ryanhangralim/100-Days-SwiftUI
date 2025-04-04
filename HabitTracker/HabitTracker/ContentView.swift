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
    @State private var habits = Habits()
    
    // Show sheets
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(habits.items) { habit in
                        NavigationLink(destination: DetailView(habit:habit)){
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(habit.type)
                                        .font(.headline)
                                    Text(habit.date, style: .date)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1), radius: 4)
                        }
                    }
                }
                .padding()
            }
            .toolbar {
                // Toolbar to add new activity
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Activity", systemImage: "plus"){
                        showingAddActivity = true
                    }
                }
                
                // Toolbar to view existing habits
                ToolbarItem(placement: .topBarLeading){
                    NavigationLink(destination: HabitView(habits: habits)) {
                        Text("View Habits")
                    }
                }
            }
            .navigationTitle("Habit Tracker")
            .sheet(isPresented: $showingAddActivity){
                AddActivity(habits: habits)
            }
        }
    }
}

#Preview {
    ContentView()
}
