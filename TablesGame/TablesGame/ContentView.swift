//
//  ContentView.swift
//  TablesGame
//
//  Created by Ceren Güneş on 1.02.2024.
//
import SwiftUI

struct ContentView: View {
    enum GameState {
        case settings, playing, gameOver
    }
    
    struct Question {
        let text: String
        let answer: Int
    }
    
    @State private var gameState: GameState = .settings
    @State private var selectedTable = 2
    @State private var numberOfQuestions = 5
    @State private var questions: [Question] = []
    @State private var currentQuestionIndex = 0
    @State private var userAnswer = ""
    @State private var score = 0
    
    var body: some View {
        
        NavigationStack {
            VStack {
                switch gameState {
                case .settings:
                    SettingsView(selectedTable: $selectedTable, numberOfQuestions: $numberOfQuestions, startGame: startGame)
                case .playing:
                    if currentQuestionIndex < numberOfQuestions {
                        Text(questions[currentQuestionIndex].text)
                        TextField("Your Answer", text: $userAnswer)
                            .keyboardType(.numberPad)
                        Button("Submit", action: checkAnswer)
                    } else {
                        Text("Game Over! You got \(score) correct out of \(numberOfQuestions).")
                        Button("Play Again", action: playAgain)
                    }
                    
                case .gameOver:
                    Text("Game Over! You got \(score) correct out of \(numberOfQuestions).")
                        .padding()
                        .onAppear {
                            resetGame()
                        }
                }
            }
            .padding()
            .navigationTitle("Multiply")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func startGame() {
        gameState = .playing
        questions = generateQuestions()
        currentQuestionIndex = 0
        userAnswer = ""
        score = 0 
    }
    
    func resetGame() {
        currentQuestionIndex = 0
        userAnswer = ""
    }
    
    func checkAnswer() {
        guard let answer = Int(userAnswer) else { return }

        if answer == questions[currentQuestionIndex].answer {
            score += 1
        }

        currentQuestionIndex += 1

        if currentQuestionIndex == numberOfQuestions {
            gameState = .gameOver
        }

        userAnswer = ""
    }

    func playAgain() {
        gameState = .settings
    }

    func generateQuestions() -> [Question] {
        var generatedQuestions: [Question] = []
        
        for _ in 0..<numberOfQuestions {
            let number = selectedTable * Int.random(in: 1...12)
            let questionText = "What is \(selectedTable) x \(number) ?"
            generatedQuestions.append(Question(text: questionText, answer: selectedTable * number))
        }
        
        return generatedQuestions
    }
}

struct SettingsView: View {
    @Binding var selectedTable: Int
    @Binding var numberOfQuestions: Int
    var startGame: () -> Void
    
    var body: some View {
        VStack {
            Stepper(value: $selectedTable, in: 2...12) {
                Text("Multiplication Table: \(selectedTable)")
            }
            Stepper(value: $numberOfQuestions, in: 5...20, step: 5) {
                Text("Number of Questions: \(numberOfQuestions)")
            }
            Button("Start Game", action: startGame)
        }
        .padding()
        .background(.ultraThinMaterial)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
