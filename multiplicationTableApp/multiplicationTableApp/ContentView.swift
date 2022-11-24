//
//  ContentView.swift
//  multiplicationTableApp
//
//  Created by Ceren Güneş on 21.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randomNumber = Int.random(in: 1..<13)
    @State private var questionsCount = 5
    @State private var selectedTable = 2
    @State private var playerScore = 1
    @State private var answer = 0
    @State private var questionIndex = 0
    @State private var isGameOn = true
    @State private var isShowing = false
    @State private var isShowingAlert = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    
    let animations = ["bear", "buffalo", "chick", "chicken", "cow", "crocodile", "dog", "duck", "elephant", "frog", "giraffe", "goat", "gorilla", "hippo", "horse", "monkey", "moose", "narwhal", "owl", "panda", "parrot", "penguin", "pig", "rabbit", "rhino", "sloth", "snake", "Thumbs", "walrus", "whale", "zebra"].shuffled()
    let numberOfQuestions = [5, 10, 20]
    
    var body: some View {
        NavigationView {
            Group {
                ZStack {
                    VStack {
                        if isGameOn {
                            
                            Spacer()
                            
                            Image("\(animations.randomElement() ?? "pig")" )
                                .animation(
                                    .interpolatingSpring(stiffness: 5, damping: 1)
                                )
                            
                            Spacer()
                            
                            Section {
                                Stepper("\(selectedTable) tables", value: $selectedTable, in: 2...12)
                                    .padding()
                            }
                        header: {
                            Text("Which table you want to practice ?")
                        }
                        .padding(5)
                        .font(.system(size: 15))
                        .foregroundColor(Color(.label))
                            
                            Section {
                                Picker("question number", selection: $questionsCount) {
                                    ForEach(numberOfQuestions, id: \.self) { number in
                                        Text("\(number)")
                                    }
                                }
                                .frame(width: 200)
                                .pickerStyle(.segmented)
                            } header: {
                                Text("How many questions do you want to solve ?")
                            }
                            .padding(5)
                            .font(.system(size: 15))
                            .foregroundColor(Color(.label))
                            
                            Spacer()
                            
                            Button {
                                generateQuestion(randomNum: randomNumber, for: questionsCount)
                                isGameOn.toggle()
                            } label: {
                                Text("start")
                            }
                            .frame(width: 280, height: 50)
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            
                            Spacer()
                            Spacer()
                            
                        } else {
                            VStack {
                                
                                VStack {
                                    Spacer()
                                    
                                    Text("Score: \(playerScore)")
                                        .font(.title)
                                    Text("What is \(randomNumber) * \(selectedTable) ?")
                                        .font(.largeTitle)
                                    
                                    TextField("type your answer here..", value: $answer, format: .number)
                                        .keyboardType(.numberPad)
                                        .frame(width: 300, height: 35)
                                        .background(.gray.opacity(0.1))
                                        .cornerRadius(15)
                                
                                    Spacer()
                                    
                                    Button {
                                        isShowingAlert = true
                                        generateQuestion(randomNum: randomNumber, for: selectedTable)
                                    } label: {
                                        VStack {
                                            Text("Enter")
                                                .padding()
                                                .frame(width: 280, height: 50)
                                                .background(.green)
                                                .foregroundColor(.white)
                                                .cornerRadius(10)
                                        }
                                    }
                                }
                                .alert(errorTitle, isPresented: $isShowingAlert) {
                                    if questionIndex != questionsCount {
                                        Button(errorMessage) {
                                            randomNumber = Int.random(in: 1..<13)
                                        }
                                    } else {
                                        Button("play again", action: gameOn)
                                    }
                                } message: {
                                    if questionIndex != questionsCount {
                                        Text("Your score is \(playerScore)")
                                    } else {
                                        Text("Your final score is \(playerScore)")
                                    }
                                }
                                .padding(.top, 35)
                                .padding(.horizontal, 30)
                            }
                            Spacer()
                        }
                    }
                }
            }
        } //VStack
    } //NavigationView
    
    func generateQuestion(randomNum: Int, for number: Int) {
        let multipliedNumber = randomNum * number
        
        if questionIndex != questionsCount {
            if multipliedNumber == answer {
                errorTitle = "Good job!"
                errorMessage = "Keep going! 🥳"
                playerScore += 1
            } else {
                errorTitle = "Wrong, the answer is \(multipliedNumber)"
                errorMessage = "Try a little bit harder! 💪"
                playerScore -= 1
            }
            questionIndex += 1
        } else {
            errorTitle = " Game over!"
            errorMessage = "Tap to play again 🤓"
        }
    }
    
    func gameOn() {
        selectedTable = 2
        isGameOn = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
