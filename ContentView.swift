//
//  ContentView.swift
//  BLAHJAJ
//
//  Created by Sirini Karunadasa on 7/5/21.
//

import SwiftUI

struct ContentView: View {
    @State private var flags = ["compliment", "compliment", "compliment", "compliment", "compliment", "compliment", "compliment", "compliment", "compliment", "compliment", "compliment"].shuffled()
    
    
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var showingScore = false
    @State private var scoreTitle = ""

    @State private var score = 0
    var body: some View {
        ZStack {
           LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
          
            
            VStack(spacing: 99) {
                VStack(spacing: 30
             ) {
                    Text("CLICK BLAHJAJ FOR A")
                        .font(.system(size:25))
                        
                    
                        .foregroundColor(.white
                                            
                )

                    Text(flags[correctAnswer].uppercased())
                    
                        .foregroundColor(.white)
                    
        
                        .font(.system(size:50))
                        .fontWeight(.black)
            
                        
    
                
                }

          
                ForEach(0 ..< 3) { number in
    
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.flags[number])
                            .renderingMode(.original)
                          
                            
                            .shadow(color: .black, radius: 2)
                    }
                }

                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("You are amazing!!"), dismissButton: .default(Text("Get another compliment!")) {
                self.askQuestion()
                
            
            })
        }
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "BLAHJAJ SAYS"
     //       self.score += 1
        } else {
            scoreTitle = "BLAHJAJ SAYS"
       //     self.score -= 1
        }

        showingScore = true
    }

    func askQuestion() {
       
        flags.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
