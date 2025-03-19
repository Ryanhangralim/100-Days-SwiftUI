//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Ryan Hangralim on 19/03/25.
//

import SwiftUI

struct CustomButtons: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .font(.system(size: 70))
            .foregroundColor(.white)
            .background(Color(red: 1.0, green: 0.44, blue: 0.38))
            .cornerRadius(12)
    }
}

extension View {
    func applyCustomButtonStyle() -> some View {
        modifier(CustomButtons())
    }
}

struct ContentView: View {
    // Options
    let options = ["🪨", "📄", "✂️"]
    
    // States
    @State private var compSelectedOption = Int.random(in: 0...2)
    @State private var userShouldWin = Bool.random()
    
    @State private var score = 0
    @State private var questionsCount: Int = 1
    @State private var gameOver = false
    
    var body: some View {
        ZStack{
            Color(red: 0.88, green: 0.97, blue: 0.98)
                .opacity(0.7)
                .ignoresSafeArea()
            
            VStack(spacing : 20) {
                Text("Score : \(score)")
                    .font(.largeTitle.weight(.bold))
                
                Text("Computer Choice: \(options[compSelectedOption])")
                    .font(.title2)
                
                Text("Turn: \(questionsCount)/10")
                    .font(.title2)
                
                Text("Move : \(userShouldWin ? "Win" : "Lose")")
                    .font(.title2)
                
                HStack(spacing: 10) {
                    ForEach(0..<3) { number in
                        Button(action: {
                            optionTapped(number)
                        }) {
                            Text(options[number])
                        }
                        .applyCustomButtonStyle()
                    }
                }
                .padding(.vertical, 15)
            }
            .padding()
        }
        .alert("Game Over", isPresented: $gameOver)
        {
            Button("Reset", action: resetGame)
        } message: {
            Text("Your final score is \(score)")
        }
    }
    
    
    // Options : "0: 🪨", "1: 📄", "2: ✂️"
    func optionTapped(_ userChoice: Int){
//        switch(compSelectedOption){
//        case 0:
//            switch(userChoice){
//            case 1:
//                score += (userShouldWin ? 1 : -1)
//            case 2:
//                score += (userShouldWin ? -1 : 1)
//            default:
//                break
//            }
//        case 1:
//            switch(userChoice){
//            case 2:
//                score += (userShouldWin ? 1 : -1)
//            case 0:
//                score += (userShouldWin ? -1 : 1)
//            default:
//                break
//            }
//        case 2:
//            switch(userChoice){
//            case 0:
//                score += (userShouldWin ? 1 : -1)
//            case 1:
//                score += (userShouldWin ? -1 : 1)
//            default:
//                break
//            }
//        default:
//            break
//        }
        
        // More efficient codes
        // Ensure positive result (0,1,2)
        let result = (userChoice - compSelectedOption + 3) % 3
        
        // 0 : Draw, 1 : User wins, 2 : Comp wins
        let userWins = (result == 1)
        
        if (userWins == userShouldWin){
            score += 1
        } else {
            score -= 1
        }

        nextQuestion()
        questionsCount += 1
    }
    
    func nextQuestion(){
        isGameOver()
        // Changes the selection
        userShouldWin.toggle()
        compSelectedOption = Int.random(in: 0...2)
    }
    
    func isGameOver() {
        if(questionsCount == 10)
        {
            gameOver = true
        }
    }
    
    func resetGame() {
        score = 0
        questionsCount = 1
        gameOver = false
        nextQuestion()
    }
}

#Preview {
    ContentView()
}
