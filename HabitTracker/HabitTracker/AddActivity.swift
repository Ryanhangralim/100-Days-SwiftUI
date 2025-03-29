//
//  AddActivity.swift
//  HabitTracker
//
//  Created by Ryan Hangralim on 29/03/25.
//

import SwiftUI

struct AddActivity: View {
    @Environment(\.dismiss) var dismiss
    
    var habits: Habits
    
    @State private var type = ""
    @State private var description = ""
    @State private var date = Date()
    @State private var duration = 5
    
    var body: some View {
        NavigationStack {
            Form {
                // Habit Type Picker
                Section("Habit Type") {
                    Picker("Habit type", selection: $type) {
                        ForEach(habits.types) { habit in
                            Text(habit.name).tag(habit.name)
                        }
                    }
                }
                
                // Description Input
                Section("Description") {
                    TextField("Enter description", text: $description)
                }
                
                // Date Picker
                Section("Date") {
                    DatePicker("Select date", selection: $date, displayedComponents: .date)
                }
                
                // Duration Stepper
                Section("Duration (minutes)") {
                    Stepper("\(duration) minutes", value: $duration, in: 5...600, step: 5)
                }
            }
            .navigationTitle("Add Activity")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveActivity()
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    // Save the new activity into the habits list
    private func saveActivity() {
        let newActivity = HabitItem(
            type: type,
            description: description,
            date: date,
            duration: duration
        )
        habits.items.append(newActivity)
    }
}

#Preview {
    AddActivity(habits: Habits())
}
