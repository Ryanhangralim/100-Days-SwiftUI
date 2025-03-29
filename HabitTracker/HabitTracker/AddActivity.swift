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
    
    @State private var selectedHabitId: UUID?
    @State private var description = ""
    @State private var date = Date()
    @State private var duration = 5
    
    // Computed property to check if form is valid
    private var isFormValid: Bool {
        selectedHabitId != nil && !description.isEmpty
    }
    
    // Find the selected habit based on its ID
    private var selectedHabit: HabitType? {
        habits.types.first { $0.id == selectedHabitId }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                // Habit Type Picker
                Section("Habit Type") {
                    Picker("Habit type", selection: $selectedHabitId) {
                        ForEach(habits.types) { habit in
                            Text(habit.name).tag(habit.id)
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
                    .disabled(!isFormValid) // Disable if form is not valid
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
        guard let selectedHabit = selectedHabit else { return }
        
        let newActivity = HabitItem(
            type: selectedHabit.name,
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
