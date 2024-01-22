//
//  ContentView.swift
//  Milestone1
//
//  Created by Ceren Güneş on 22.01.2024.
//

import SwiftUI

enum Choice: String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
}

struct ContentView: View {
    @State private var userChoice: Choice?
    @State private var computerChoice: Choice?
    @State private var gameResult: String?
    @State private var score = 0
    @State private var isGameOver = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Score: \(score)")
                    .fontWeight(.bold)
                HStack {
                    ForEach(Choice.allCases, id: \.self) { choice in
                        Button(action: {
                            playGame(choice)
                        }) {
                            Text(choice.rawValue)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()

                Text("Player: \(userChoice?.rawValue ?? "-")")
                    .padding()
                Text("Computer: \(computerChoice?.rawValue ?? "-")")
                    .padding()
                Text("Result: \(gameResult ?? "-")")
                    .padding()


                Button(action: {
                    playAgain()
                }) {
                    Text("Play Again")
                }
                .padding()
                .alert(isPresented: $isGameOver) {
                    Alert(
                        title: Text("Your score is \(score)."),
                        message: Text("Play again"),
                        primaryButton: .default(Text("Play")) {
                            playAgain()
                        },
                        secondaryButton: .cancel()
                    )
                }
            }
            .navigationTitle("Rock, Paper, Scissors")
        }
    }

    func playGame(_ choice: Choice) {
        userChoice = choice
        computerChoice = Choice.allCases.randomElement()

        if let computerChoice = computerChoice {
            if userChoice == computerChoice {
                gameResult = "It's a tie!"
            } else if (userChoice == .rock && computerChoice == .scissors) ||
                      (userChoice == .paper && computerChoice == .rock) ||
                      (userChoice == .scissors && computerChoice == .paper) {
                gameResult = "You win!"
                score += 1
            } else {
                gameResult = "You lose!"
                score -= 1
            }
        }
        
        isGameOver = score == 2 ? true : false
    }

    func playAgain() {
        isGameOver = false
        score = 0
        userChoice = nil
        computerChoice = nil
        gameResult = nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
