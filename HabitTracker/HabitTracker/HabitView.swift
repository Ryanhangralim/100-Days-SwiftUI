//
//  HabitView.swift
//  HabitTracker
//
//  Created by Ryan Hangralim on 29/03/25.
//

import SwiftUI

struct HabitView: View {
    @Environment(\.dismiss) var dismiss
    @State private var newType: String = ""
    var habits: Habits

    var body: some View {
        NavigationStack {
            VStack{
                Form {
                    // Textfield to add new habit type
                    HStack{
                        TextField("Add new habit", text: $newType)
                        Button("Add"){
                            if !newType.isEmpty {
                                let newHabitType = HabitType(name: newType)
                                habits.types.append(newHabitType)
                                newType = ""
                            }
                        }
                        .disabled(newType.isEmpty)
                    }
                    
                    // Show list of existing habit types
                    Section("Existing Habits"){
                        if habits.types.isEmpty {
                            Text("No habits added yet")
                                .foregroundColor(.gray)
                        } else {
                            List(habits.types) { type in
                                Text(type.name)
                            }
                        }
                    }
                }
            }
                .navigationTitle("Habit List")
                .toolbar {
                    // Toolbar to go back to home page
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            HStack {
                                Image(systemName: "chevron.left")
                                Text("Back")
                            }
                        }
                    }
                }
                .navigationBarBackButtonHidden(true) // Hides the default back button
        }
        
    }
}

#Preview {
    HabitView(habits: Habits())
}
