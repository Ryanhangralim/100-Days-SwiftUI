//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ryan Hangralim on 17/03/25.
//

import SwiftUI

struct FlagImage: View {
    var number: Int
    var countries: [String]
    
    var body : some View {
        Image(countries[number])
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score: Int = 0
    @State private var questionsLeft: Int = 8
    @State private var gameOver: Bool = false
    
    var body: some View {
        ZStack{
            //            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack{
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                Text("Questions Left: \(questionsLeft)")
                    .foregroundStyle(.white)
                
                VStack(spacing: 15){
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        FlagImage(number: number, countries: countries)
                        Button{
                            // flag was tapped
                            flagTapped(number)
                        } label: {
                            FlagImage(number: number, countries: countries)
//                            Image(countries[number])
//                                .clipShape(.capsule)
//                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game Over", isPresented: $gameOver)
        {
            Button("Reset", action: resetGame)
        } message: {
            Text("Your final score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the the flag of \(countries[number])"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        isGameOver()
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func isGameOver() {
        questionsLeft -= 1
        if(questionsLeft == 0)
        {
            gameOver = true
        }
    }
    
    func resetGame() {
        score = 0
        questionsLeft = 8
        showingScore = false
        gameOver = false
        askQuestion()
    }
}

#Preview {
    ContentView()
}
