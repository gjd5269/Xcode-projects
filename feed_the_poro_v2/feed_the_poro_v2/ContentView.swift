// ContentView.swift

import SwiftUI
enum ActiveSheet: Identifiable {
    case preferences, hints
    
    var id: Int {
        switch self {
        case .preferences:
            return 1
        case .hints:
            return 2
        }
    }
}

struct ContentView: View {
    @StateObject var gameManager = GameManager()
    @State private var activeSheet: ActiveSheet?
    @State private var showPreferences = false
    @State private var showHints = false
    
    
    var body: some View {
        VStack(spacing: 20) {
            Image("poro")
            
            Text("Current Word: \(gameManager.scramble.currentWord)")
                .font(.headline)
            
            Text("Score: \(gameManager.scramble.score)")
                .font(.headline)
            // ContentView.swift

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(gameManager.scramble.foundWords, id: \.self) { word in
                        Text(word)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                            
                            
                    }
                }
               
                
            }
            
            .padding(.top, 20)
            Divider()
            if gameManager.preferences.numberOfLetters == .four {
                
                
                VStack{
                    Button(action:{gameManager.addLetter(gameManager.scramble.letters[0])})
                    {
                        Text(String(gameManager.scramble.letters[0]))
                            .frame(width: 100, height: 100)
                            .background(Diamond().fill(Color.yellow))
                    }
                    
                    ZStack{
                        Button(action:{gameManager.addLetter(gameManager.scramble.letters[3])})
                        {
                            Text(String(gameManager.scramble.letters[3]))
                                .frame(width: 100, height: 100)
                                .background(Diamond().fill(Color.gray))
                        }.offset(x:70,y:-175 )
                        //
                        Button(action:{gameManager.addLetter(gameManager.scramble.letters[4])})
                        {
                            Text(String(gameManager.scramble.letters[4]))
                                .frame(width: 100, height: 100)
                                .background(Diamond().fill(Color.gray))
                        }
                        .offset(x:-70,y:-175 )
                        
                        Button(action:{gameManager.addLetter(gameManager.scramble.letters[1])})
                        {
                            Text(String(gameManager.scramble.letters[1]))
                                .frame(width: 100, height: 100)
                                .background(Diamond().fill(Color.gray))
                        }
                        .offset(x:70,y:-40 )
                        
                        Button(action:{gameManager.addLetter(gameManager.scramble.letters[2])})
                        {
                            Text(String(gameManager.scramble.letters[2]))
                                .frame(width: 100, height: 100)
                                .background(Diamond().fill(Color.gray))
                        }
                        .offset(x:-70,y:-40 )
                        
                        
                    }
                    
                }.offset(x:0,y:50)
            }
            if gameManager.preferences.numberOfLetters == .five {
                
                
                VStack{
                    Button(action:{gameManager.addLetter(gameManager.scramble.letters[0])})
                    {
                        Text(String(gameManager.scramble.letters[0]))
                            .frame(width: 100, height: 100)
                            .background(Pentagon().fill(Color.yellow))
                    }
                    
                    ZStack{
                        Button(action:{gameManager.addLetter(gameManager.scramble.letters[3])})
                        {
                            Text(String(gameManager.scramble.letters[3]))
                                .frame(width: 100, height: 100)
                                .background(Pentagon().fill(Color.gray).rotationEffect(Angle(radians: CGFloat.pi*1)))
                        }.offset(x:50,y:-175 )
                        //
                        Button(action:{gameManager.addLetter(gameManager.scramble.letters[4])})
                        {
                            Text(String(gameManager.scramble.letters[4]))
                                .frame(width: 100, height: 100)
                                .background(Pentagon().fill(Color.gray).rotationEffect(Angle(radians: CGFloat.pi*1)))
                        }
                        .offset(x:-50,y:-175 )
                        
                        Button(action:{gameManager.addLetter(gameManager.scramble.letters[1])})
                        {
                            Text(String(gameManager.scramble.letters[1]))
                                .frame(width: 100, height: 100)
                                .background(Pentagon().fill(Color.gray).rotationEffect(Angle(radians: CGFloat.pi*1)))
                        }
                        .offset(x:80,y:-80 )
                        
                        Button(action:{gameManager.addLetter(gameManager.scramble.letters[2])})
                        {
                            Text(String(gameManager.scramble.letters[2]))
                                .frame(width: 100, height: 100)
                                .background(Pentagon().fill(Color.gray).rotationEffect(Angle(radians: CGFloat.pi*15)))
                        }
                        .offset(x:-80,y:-80 )
                        Button(action:{gameManager.addLetter(gameManager.scramble.letters[5])})
                        {
                            Text(String(gameManager.scramble.letters[5]))
                                .frame(width: 100, height: 100)
                                .background(Pentagon().fill(Color.gray).rotationEffect(Angle(radians: CGFloat.pi*15)))
                        }
                        .offset(x:-0,y:-20 )
                        
                        
                    }
                    
                }.offset(x:0,y:50)
            }
            if gameManager.preferences.numberOfLetters == .six {
                
                
                VStack{
                    Button(action:{gameManager.addLetter(gameManager.scramble.letters[0])})
                    {
                        Text(String(gameManager.scramble.letters[0]))
                            .frame(width: 100, height: 100)
                            .background(Hexagon().fill(Color.yellow))
                    }
                    
                    ZStack{
                        Button(action:{gameManager.addLetter(gameManager.scramble.letters[3])})
                        {
                            Text(String(gameManager.scramble.letters[3]))
                                .frame(width: 100, height: 100)
                                .background(Hexagon().fill(Color.gray).rotationEffect(Angle(radians: CGFloat.pi*1)))
                        }.offset(x:80,y:-150 )
                        //
                        Button(action:{gameManager.addLetter(gameManager.scramble.letters[4])})
                        {
                            Text(String(gameManager.scramble.letters[4]))
                                .frame(width: 100, height: 100)
                                .background(Hexagon().fill(Color.gray).rotationEffect(Angle(radians: CGFloat.pi*1)))
                        }
                        .offset(x:-80,y:-160 )
                        
                        Button(action:{gameManager.addLetter(gameManager.scramble.letters[1])})
                        {
                            Text(String(gameManager.scramble.letters[1]))
                                .frame(width: 100, height: 100)
                                .background(Hexagon().fill(Color.gray).rotationEffect(Angle(radians: CGFloat.pi*1)))
                        }
                        .offset(x:80,y:-60 )
                        
                        Button(action:{gameManager.addLetter(gameManager.scramble.letters[2])})
                        {
                            Text(String(gameManager.scramble.letters[2]))
                                .frame(width: 100, height: 100)
                                .background(Hexagon().fill(Color.gray).rotationEffect(Angle(radians: CGFloat.pi*15)))
                        }
                        .offset(x:-80,y:-60 )
                        Button(action:{gameManager.addLetter(gameManager.scramble.letters[5])})
                        {
                            Text(String(gameManager.scramble.letters[5]))
                                .frame(width: 100, height: 100)
                                .background(Hexagon().fill(Color.gray).rotationEffect(Angle(radians: CGFloat.pi*15)))
                        }
                        .offset(x:-0,y:-10 )
                        Button(action:{gameManager.addLetter(gameManager.scramble.letters[6])})
                        {
                            Text(String(gameManager.scramble.letters[6]))
                                .frame(width: 100, height: 100)
                                .background(Hexagon().fill(Color.gray).rotationEffect(Angle(radians: CGFloat.pi*15)))
                        }
                        .offset(x:-0,y:-200 )
                        
                    }
                    
                }.offset(x:0,y:70)
            }
            HStack{
                Button(action: gameManager.submitWord) {
                    Text("Submit")
                        .padding()
                        .background(gameManager.scramble.isCurrentWordValid ? Color.green : Color.gray)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .disabled(!gameManager.scramble.isCurrentWordValid)
                
                Button(action: gameManager.deleteLastLetter) {
                    Text("Delete")
                        .padding()
                        .background(gameManager.scramble.currentWord.isEmpty ? Color.gray : Color.red)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .disabled(gameManager.scramble.currentWord.isEmpty)
                
            }.offset(x:0,y:50)
            
            
           
            HStack{
                           Button(action: gameManager.shuffleLetters) {
                               Image(systemName: "shuffle.circle")
                           }
                           Button(action: {
                               activeSheet = .hints
                           }) {
                               Image(systemName: "lightbulb.circle")
                           }
                           Button(action: gameManager.startNewGame) {
                               Image(systemName: "plus.circle")
                           }
                           Button(action: {
                               showPreferences.toggle()
                               activeSheet = .preferences
                               
                               
                           }) {
                               Image(systemName: "info.circle")
                           }
                       }
                        .offset(x:0,y:50)
                       .buttonStyle(.borderedProminent)
                   }
                   .padding()
                   .sheet(item: $activeSheet) { item in
                       switch item {
                       case .preferences:
                           PreferencesView(preferences: $gameManager.preferences)
                       case .hints:
                           HintsView(hints: gameManager.hints)
                       }
                   }
    }
        

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


