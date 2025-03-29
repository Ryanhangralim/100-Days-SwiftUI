//
//  DetailView.swift
//  HabitTracker
//
//  Created by Ryan Hangralim on 29/03/25.
//

import SwiftUI

struct DetailView: View {
    var habit: HabitItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Description: \(habit.description)")
                .font(.body)
            
            Text("Date: \(habit.date, style: .date)")
                .font(.body)
            
            Text("Duration: \(habit.duration) minutes")
                .font(.body)
        }
        .padding()
        .navigationTitle(habit.type)
    }
}

#Preview {
    DetailView(habit: HabitItem(
        type: "Exercise",
        description: "Morning run",
        date: Date(),
        duration: 30
    ))
}

