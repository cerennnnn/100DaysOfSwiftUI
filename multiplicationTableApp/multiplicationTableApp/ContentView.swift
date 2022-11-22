//
//  ContentView.swift
//  multiplicationTableApp
//
//  Created by Ceren Güneş on 21.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var questions = []
    @State private var answers = [Int]()
    @State private var randomNumber = Int.random(in: 1..<13)
    @State private var userSelection = 5
    @State private var tableNumber = 2
    @State private var playerScore = 0
    @State private var answer = 0
    @State private var questionNumber = 0
    @State private var isGameOn = false
    @State private var isShowing = false
    @FocusState private var isKeyboardShowing: Bool
    
    let animations = ["bear", "buffalo", "chick", "chicken", "cow", "crocodile", "dog", "duck", "elephant", "frog", "giraffe", "goat", "gorilla", "hippo", "horse", "monkey", "moose", "narwhal", "owl", "panda", "parrot", "penguin", "pig", "rabbit", "rhino", "sloth", "snake", "Thumbs", "walrus", "whale", "zebra"].shuffled()
    let numberOfQuestions = [5, 10, 20]
    
    var body: some View {
        NavigationView {
            Group {
                ZStack {
                    //                    LinearGradient(gradient: Gradient(colors: [ .white, .blue, .yellow, .red, .purple]),
                    //                                   startPoint: isGameOn ? .topLeading : .bottomTrailing , endPoint: isGameOn ? .bottomTrailing : .topLeading)
                    //                        .ignoresSafeArea()
                    
                    VStack {
                        if !isGameOn {
                            
                            Spacer()
                            
                            Image("\(animations.randomElement() ?? "pig")" )
                                .animation(
                                    .interpolatingSpring(stiffness: 5, damping: 1)
                                )
                            
                            Spacer()
                            
                            Section {
                                Stepper("\(tableNumber) tables", value: $tableNumber, in: 2...12)
                                    .padding()
                            }
                        header: {
                            Text("Which table you want to practice ?")
                        }
                        .padding(5)
                        .font(.system(size: 15))
                        .foregroundColor(Color(.label))
                            
                            Section {
                                Picker("question number", selection: $userSelection) {
                                    ForEach(numberOfQuestions, id: \.self) { number in
                                        Text("\(number)")
                                    }
                                }
                                .pickerStyle(.segmented)
                            } header: {
                                Text("How many questions do you want to solve ?")
                            }
                            .padding(5)
                            .font(.system(size: 15))
                            .foregroundColor(Color(.label))
                            
                            Spacer()
                            
                            Button {
                                generateQuestion()
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
                                
                                Spacer()
                                
                                Image(animations[Int.random(in: 0..<animations.count)])
                                    .animation(
                                        .interpolatingSpring(stiffness: 5, damping: 1)
                                    )
                                
                                Spacer()
                                
                                VStack {
                                    Form {
                                        ForEach(0..<(answers.count), id: \.self) { num in
                                        Text("Score: \(playerScore)")
                                        
                                        Text("What's \(tableNumber) * \(randomNumber) ?")
                                            .foregroundColor(.black)
                                        
                                        TextField("answer: ", value: $answer, format: .number)
                                            .focused($isKeyboardShowing)
                                            .keyboardType(.decimalPad)
                                            .onAppear {
                                                generateQuestion()
                                                    if answers[num] == answer {
                                                        playerScore += 1
                                                    } else {
                                                        playerScore -= 1
                                                    }
                                                }
                                        }
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                }
            } //VStack
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button {
                        isKeyboardShowing = false
                    } label: {
                        Text("Submit")
                    }
                }
            }
        } //NavigationView
    }
    
    func generateQuestion() {
//        for number in 1...userSelection {
//            var randomNumber = Int.random(in: 1..<13)
//            let answer = tableNumber * randomNumber
            answer = tableNumber * randomNumber
//            answers.append(answer)
//            questions.append("\(tableNumber) * \(randomNumber)")
//
//            print("random number \(number): \(randomNumber)")
//            print("questions array: \(questions)")
//            print("answers array: \(answers)")
//        }
    }
    
    func gameOver() {
        answer = 0
        playerScore = 0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct Questions: View {
//    let answers = [Int]()
//    let questions = [String]()
//    let tableNumber: Int
//    let userSelection: Int
//
//    var body: some View {
//        for number in 1...userSelection {
//            var randomNumber = Int.random(in: 1..<13)
//            let answer = tableNumber * randomNumber
//
//            answers.append(answer)
//            questions.append("\(tableNumber) * \(randomNumber)")
//
//            print("random number \(number): \(randomNumber)")
//            print("questions array: \(questions)")
//            print("answers array: \(answers)")
//
//        }
//    }
//}
