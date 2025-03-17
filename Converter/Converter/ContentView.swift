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
    
    // Lenght Functions
    // Convert to base foots
    var convertToFoot: Double {
        switch lengthInputType {
        case "Meters":
            return lengthInput * 3.281
        case "Kilometers":
            return lengthInput * 3281.0
        case "Yard":
            return lengthInput * 3.0
        case "Miles":
            return lengthInput * 5280.0
        default:
            return lengthInput
        }
    }
    
    // Convert to output
    var lengthOutput: Double {
        switch lengthOutputType {
        case "Meters":
            return convertToFoot / 3.281
        case "Kilometers":
            return convertToFoot / 3281.0
        case "Yard":
            return convertToFoot / 3.0
        case "Miles":
            return convertToFoot / 5280.0
        default:
            return convertToFoot
        }
    }
    
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
                    // Input Length Type
                    Picker("Input Length", selection: $lengthInputType){
                        ForEach(lengths, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    // Input Length
                    HStack {
                        TextField("Enter lengths", value: $lengthInput, format: .number)
                            .keyboardType(.decimalPad)
                        Text(lengthInputType) // Display unit next to input
                            .foregroundStyle(.secondary)
                    }
                    
                    // Swap type
                    Button(action: {
                        let temp = lengthInputType
                        lengthInputType = lengthOutputType
                        lengthOutputType = temp
                    }) {
                        HStack{
                            Spacer()
                            Image(systemName: "arrow.right.arrow.left")
                            Spacer()
                        }
                    }
                    
                    // Output Length Type
                    Picker("Output Length", selection: $lengthOutputType){
                        ForEach(lengths, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    // Output Length
                    HStack {
                        Text(lengthOutput.formatted())
                        Spacer()
                        Text(lengthOutputType) // Display unit next to output
                            .foregroundStyle(.secondary)
                    }
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
