        //
        //  ContentView.swift
        //  GuessTheFlag
        //
        //  Created by Ceren Güneş on 31.10.2022.
        //

        import SwiftUI

        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                    content
                    .font(.largeTitle)
                    .foregroundColor(.blue)
            }
        }

        extension View {
            func titleStyle() -> some View {
                modifier(Title())
            }
        }

        struct FlagImage: View {
            var flagArray: [String]
            var number: Int
            var rotateAmount: Double
            var selectedFlag: Int
            var showingScore: Bool
            
            var body: some View {
                Image(flagArray[number])
                    .clipShape(Capsule())
                    .shadow(radius: 5)
                    .rotation3DEffect(Angle(degrees: rotateAmount), axis: (x: 0, y: 1, z: 0))
                    .opacity(showingScore && number != selectedFlag ? 0.25 : 1.0 )
                    .animation(showingScore && number != selectedFlag ? .spring() : .easeInOut(duration: 1), value: showingScore)
            }
        }

        struct ContentView: View {
            @State private var isGameFinished = false
            @State private var showingScore = false
            @State private var scoreTitle = ""
            @State private var userScore = 0
            @State private var correctAnswer = Int.random(in: 0...2)
            @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
            @State private var numberOfQuestions = 0
            @State private var rotateAmount = 0.0
            @State private var selectedFlag = -1
            
            var body: some View {
                ZStack {
                    RadialGradient(stops: [
                        .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                        .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                    ], center: .top, startRadius: 200, endRadius: 700)
                    .ignoresSafeArea()
                    
                    VStack {
                        Spacer()
                        
                        Text("Guess the flag")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                        VStack(spacing: 15) {
                            VStack {
                                Text("Tap the flag off")
                                    .font(.subheadline.weight(.heavy))
                                    .foregroundColor(.secondary)
                                Text(countries[correctAnswer])
                                    .font(.largeTitle.weight(.semibold))
                                    .modifier(Title())
                                    .titleStyle()
                            }
                            
                            ForEach(0..<3) { number in
                                Button {
                                    withAnimation {
                                        flagTapped(number)
                                    }
                                } label: {
                                    FlagImage(flagArray: countries, number: number, rotateAmount: rotateAmount, selectedFlag: selectedFlag, showingScore: showingScore)
                            }
                                .rotation3DEffect(Angle(degrees: rotateAmount), axis: (x: 0, y: 1, z: 0))
                                }
                            }
                        
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Spacer()
                        Spacer()
                        
                        Text("Score: \(userScore)")
                            .foregroundColor(.white)
                            .font(.title.bold())
                        
                        Spacer()
                    }
                    .padding()
                }
                
                .alert(scoreTitle, isPresented: $showingScore) {
                    if numberOfQuestions < 8 {
                        Button("Continue", action: askQuestion)
                    } else {
                        Button("Tap to start over", action: reset)
                    }
                } message: {
                    if numberOfQuestions < 8 {
                        Text("Your score: \(userScore)")
                    } else {
                        Text("Final score: \(userScore)")
                    }
                }
            }
            
            func flagTapped(_ number: Int) {
                rotateAmount += 360
                numberOfQuestions += 1
                selectedFlag = number
                
                if number == correctAnswer {
                    scoreTitle = "Correct!"
                    userScore += 10
                } else {
                    scoreTitle = "Wrong, that's the flag of \(countries[number])"
                    userScore -= 5
                }
                showingScore = true
            }
            
            func askQuestion() {
                countries.shuffle()
                correctAnswer = Int.random(in: 0...2)
                selectedFlag = -1
            }
            
            func reset() {
                isGameFinished = true
                userScore = 0
                askQuestion()
            }
        }


        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
