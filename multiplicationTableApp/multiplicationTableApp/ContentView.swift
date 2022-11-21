//
//  ContentView.swift
//  multiplicationTableApp
//
//  Created by Ceren Güneş on 21.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var userSelection = 5
    @State private var multiplicationSelection = 2
    @State private var correctAnswer = ""
    @State private var questionsArray = []
    @State private var isEnable = false
    @State private var randomNumber = Int.random(in: 1..<13)
    
    let numberOfQuestions = [5, 10, 20]
    
    var body: some View {
        NavigationView {
            VStack {
                if !isEnable {
                    
                    Spacer()
                    
                    if multiplicationSelection == 2 {
                        Image("bear")
                    } else if multiplicationSelection == 3 {
                        Image("dog")
                    } else if multiplicationSelection == 4 {
                        Image("pig")
                    } else if multiplicationSelection == 5 {
                        Image("owl")
                    } else if multiplicationSelection == 6 {
                        Image("cow")
                    } else if multiplicationSelection == 7 {
                        Image("elephant")
                    } else if multiplicationSelection == 8 {
                        Image("frog")
                    } else if multiplicationSelection == 9 {
                        Image("giraffe")
                    } else if multiplicationSelection == 10 {
                        Image("panda")
                    } else if multiplicationSelection == 11 {
                        Image("rabbit")
                    } else if multiplicationSelection == 12 {
                        Image("cat")
                    }
                    
                    Spacer()
                    
                    Section {
                        Stepper( multiplicationSelection == 1 ? "\(multiplicationSelection) table" : "\(multiplicationSelection) tables", value: $multiplicationSelection, in: 2...12)
                    }
                header: {
                    Text("Which multiplication table you want to practice ?")
                }
                .padding(5)
                    
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
                    
                    Spacer()
                    Button {
                        generateQuestion()
                        isEnable.toggle()
                    } label: {
                        Text("start")
                    }
                    .frame(width: 280, height: 50)
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Spacer()
                } else {
//                    ForEach
                    Text("What's \(multiplicationSelection) times \(randomNumber)")
                    
                }
            } //VStack
        } //NavigationView
    }
    
    func generateQuestion() {
        
        for number in 1...userSelection {
            
            let question = "\(multiplicationSelection) * \(randomNumber)"
            
             questionsArray.append(question)
            
//            print("random number \(number): \(randomNumber)")
//            print("\(multiplicationSelection) * \(randomNumber)")
//            print(Int((multiplicationSelection) * (randomNumber)))
//            print(questionsArray)
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
