//
//  ContentView.swift
//  WeSplit
//
//  Created by Ryan Hangralim on 16/03/25.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool

    let tipPercentages : [Int] = [0, 10, 15, 20, 25]
    
    var checkTotal : Double {
        return checkAmount + (Double(tipPercentage) / 100 * checkAmount)
    }
    
    var totalPerPerson : Double {
        return checkTotal / Double(numberOfPeople + 2) //2 is for using value instead of index
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section{
                    TextField("Check Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach (2..<101) { value in
                            Text("\(value)")
                        }
                    }
                    .pickerStyle(.navigationLink) // Remove to have inpage input
                }
                
                Section("How much tip do you want to leave?"){
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Total amount to pay including tip"){
                    Text(checkTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundStyle(tipPercentage == 0 ? .red : .primary)
                }
                
                Section("Amount per person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar{
                if amountIsFocused {
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
