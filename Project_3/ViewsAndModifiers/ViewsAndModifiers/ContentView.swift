//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ryan Hangralim on 18/03/25.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View {
    func blueTitleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        Text("This should be a blue title")
        .blueTitleStyle()
    }
}

#Preview {
    ContentView()
}
