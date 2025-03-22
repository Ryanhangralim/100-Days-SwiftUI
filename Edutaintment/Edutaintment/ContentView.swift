//
//  ContentView.swift
//  Edutaintment
//
//  Created by Ryan Hangralim on 22/03/25.
//

import SwiftUI

struct Question {
    let text: String
    let answer: Int
}


struct ContentView: View {
    // Multiplication table
    @State private var selectedMultiplicationTable = 2
    
    // Number of questions variables
    let numberOfQuestions = [5, 10, 20]
    @State private var selectedNumberOfQuestions = 5
    
    // Questions and answers
    @State private var questions = [Question]()
    
    @State private var currentQuestionIndex = 0
    @State private var userAnswer = ""
    @State private var score = 0
    
    @State private var gameOver = false
    @State private var isGameActive: Bool = false
    
    @State private var showMistake = false
    
    var body: some View {
        NavigationStack {
            if isGameActive {
                // Show questions when game is active
                questionView
            } else {
                // Show settings when game is not active
                settingsView
            }
        }
    }

    var settingsView: some View {
        Form {
            Section("Pick the multiplication table") {
                Stepper("\(selectedMultiplicationTable)", value: $selectedMultiplicationTable, in: 2...12)
            }
            
            Section("Pick the number of questions") {
                Picker("Number of Questions", selection: $selectedNumberOfQuestions) {
                    ForEach(numberOfQuestions, id: \.self) { value in
                        Text("\(value)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Button("Start Game") {
                startGame()
            }
        }
        .navigationTitle("Edutainment")
    }

    var questionView: some View {
        VStack {
            Text(questions[currentQuestionIndex].text)
                .font(.largeTitle)
                .padding()
            
            Text("Score: \(score)")
                .font(.headline)
                .padding()
            
            TextField("Answer", text: $userAnswer)
                .keyboardType(.decimalPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding()

            Button("Submit") {
                checkAnswer()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Spacer()
        }
        .navigationTitle("Question \(currentQuestionIndex + 1)/\(questions.count)")
        .alert("Oops you got that one wrong!", isPresented: $showMistake){
            Button("Continue", action: nextQuestion)
        } message: {
            Text("The correct answer is \(questions[currentQuestionIndex].answer)")
        }
        .alert("Game Over", isPresented: $gameOver){
            Button("Reset", action: resetGame)
        } message: {
            Text("Your final score is \(score)/\(selectedNumberOfQuestions)")
        }
    }
    
    // Generate questions and start game
    func startGame(){
        questions.removeAll() // Clear previous questions
        
        for _ in 0..<selectedNumberOfQuestions {
            let number = Int.random(in: 1...50)
            let questionText = "\(selectedMultiplicationTable) x \(number)"
            let answer = selectedMultiplicationTable * number
            
            let newQuestion = Question(text: questionText, answer: answer)
            questions.append(newQuestion)
        }
        currentQuestionIndex = 0
        score = 0
        isGameActive = true
    }
    
    // Check user answers
    func checkAnswer() {
        if let answer = Int(userAnswer), answer == questions[currentQuestionIndex].answer {
            score += 1
            nextQuestion()
        } else{
            showMistake = true
        }
    }
    
    // Next question
    func nextQuestion() {
        userAnswer = "" // Reset input
        
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            // End the game
            gameOver = true
        }
    }
    
    // Reset game
    func resetGame() {
        gameOver = false
        isGameActive = false
    }
    
}

#Preview {
    ContentView()
}
