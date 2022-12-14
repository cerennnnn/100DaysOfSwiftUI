//
//  ContentView.swift
//  RockPaperScissorsShoot
//
//  Created by Ceren GÃ¼neÅ on 4.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentChoice = ""
    @State private var didWin = Bool.random()
    @State private var playerScore = 0
    @State private var isShownAlert = false
    @State private var winOrLose = Bool.random()
    @State private var random = Int.random(in: 0...2)
    @State private var numberOfQuestions = 1
    @State private var isFinished = false
    @State private var choices = ["ðª¨", "ð", "âï¸"]
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Spacer()
            Text("Score : \(playerScore)")
                .font(.largeTitle.bold())
            
            Spacer()
            
            Text("Ai's choice: \(choices[random])")
                .padding(20)
            Text("player should \(didWin ? "win" : "lose")")
            
            Spacer()
            
            HStack(spacing: 20) {
                ForEach(0..<3) { number in
                    Button {
                        currentChoice = choices[number]
                        logic(ai: choices[random], player: currentChoice, status: didWin)
                        isShownAlert = true
                    } label: {
                        Text(choices[number])
                    }
                    .padding(20)
                    .font(.largeTitle)
                    .background(.thinMaterial)
                    .cornerRadius(35)
                }
            }
            .padding(20)
            .alert( didWin ? "You win ð¥³" : "You lost ð" , isPresented: $isShownAlert) {
                if numberOfQuestions < 5 {
                    Button("Continue", action: newRound)
                } else {
                    Button("Tap to play again!", action: resetGame)
                }
            } message: {
                if numberOfQuestions < 5 {
                     Text("Score: \(playerScore)")
                } else {
                    Text("Final score is \(playerScore)")
                }
            }
            
            Spacer()
        }
    }
    
    func logic(ai: String, player: String, status: Bool) {
        print(numberOfQuestions)
        
        if ai == player {
            didWin = false
            playerScore -= 1
        }
        else if ai == "ðª¨" && status == true {
            if player == "ð" {
                didWin = true
                playerScore += 1
            } else {
                didWin = false
                playerScore -= 1
            }
        }
        else if ai == "ð" && status == true {
            if player == "âï¸" {
                didWin = true
                playerScore += 1
            } else {
                didWin = false
                playerScore -= 1
            }
        }
        else if ai == "âï¸" && status == true {
            if player == "ðª¨" {
                didWin = true
                playerScore += 1
            } else {
                didWin = false
                playerScore -= 1
            }
        }
        else if ai == "ðª¨" && status == false {
                if player == "âï¸" {
                    didWin = true
                    playerScore += 1
                } else {
                    didWin = false
                    playerScore -= 1
                }
            }
        else if ai == "ð" && status == false {
                if player == "ðª¨" {
                    didWin = true
                    playerScore += 1
                } else {
                    didWin = false
                    playerScore -= 1
                }
            }
        else if ai == "âï¸" && status == false {
                if player == "ð" {
                    didWin = true
                    playerScore += 1
                } else {
                    didWin = false
                    playerScore -= 1
                }
        }
    }
    
    func newRound() {
        numberOfQuestions += 1
        random = Int.random(in: 0...2)
        didWin.toggle()
        currentChoice = ""
    }
    
    func resetGame() {
        isFinished = true
        numberOfQuestions = 0
        playerScore = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
