import SwiftUI
struct HintsView: View {
    let hints: (totalWords: Int, totalPoints: Int, pangrams: Int, wordLengths: [Int: Int],startingLetters: [Character: [Int: Int]])
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Total number of words: \(hints.totalWords)")
            Text("Total possible points: \(hints.totalPoints)")
            Text("Number of pangrams: \(hints.pangrams)")
            
            Divider()
            
            ForEach(Array(hints.wordLengths.keys).sorted(), id: \.self) { length in
                VStack(alignment: .leading){
                    Text("Word of length \(length): \(hints.wordLengths[length] ?? 0)")
                    
                    ForEach(Array(hints.startingLetters.keys).sorted(), id: \.self) { startingLetter in
                        if let count = hints.startingLetters[startingLetter]?[length], count > 0 {
                            Text("   \(String(startingLetter)): \(count)")
                        }
                    }

                }
            }
        }
    }
}
