//
//  ContentView.swift
//  Instafilter
//
//  Created by Ryan Hangralim on 05/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var commit = 0
    var body: some View {
        VStack {
            Button{
                commit += 1
            }label: {
                Text("Commit count: \(commit)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
