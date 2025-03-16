//
//  ContentView.swift
//  Converter
//
//  Created by Ryan Hangralim on 16/03/25.
//

import SwiftUI

struct ContentView: View {
    // Temperature Variables
    let temperatures = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var tempInputType = "Celsius"
    @State private var tempInput = 0.0
    @State private var tempOutputType = "Fahrenheit"
    
    // Temperature Functions
    // Convert to base celcius
    var convertToCelcius: Double {
        switch tempInputType {
        case "Fahrenheit":
            return (tempInput - 32) * 5 / 9
        case "Kelvin":
            return tempInput - 273.15
        default:
            return tempInput
        }
    }
    
    // Convert to output
    var temperatureOutput: Double {
        switch tempOutputType {
        case "Fahrenheit":
            return convertToCelcius * 9 / 5 + 32
        case "Kelvin":
            return convertToCelcius + 273.15
        default:
            return convertToCelcius
        }
    }
    
    // Length Variables
    let lengths = ["Meters", "Kilometers", "Feet", "Yard", "Miles"]
    @State private var lengthInputType = "Meters"
    @State private var lengthInput = 0.0
    @State private var lengthOutputType = "Kilometers"
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Temperature Converter")) {
                    // Input Temperature Type
                    Picker("Input Temperature", selection: $tempInputType){
                        ForEach(temperatures, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    // Input Temperature
                    HStack {
                        TextField("Enter Temperature", value: $tempInput, format: .number)
                            .keyboardType(.decimalPad)
                        Text(tempInputType) // Display unit next to input
                            .foregroundStyle(.secondary)
                    }
                    
                    // Swap type
                    Button(action: {
                        let temp = tempInputType
                        tempInputType = tempOutputType
                        tempOutputType = temp
                    }) {
                        HStack{
                            Spacer()
                            Image(systemName: "arrow.right.arrow.left")
                            Spacer()
                        }
                    }
                    
                    // Output Temperature Type
                    Picker("Output Temperature", selection: $tempOutputType){
                        ForEach(temperatures, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    // Output Temperature
                    HStack {
                        Text(temperatureOutput.formatted())
                        Spacer()
                        Text(tempOutputType) // Display unit next to output
                            .foregroundStyle(.secondary)
                    }
                }
                
                Section(header: Text("Length Converter")) {
                    
                }
                
//                Section(header: Text("Section 2")) {
//                    Text("Hello World 2")
//                }
            }
            .navigationTitle("Converter")
        }
    }
}

#Preview {
    ContentView()
}
