import SwiftUI

class GameManager: ObservableObject {
    @Published var scramble: Scramble
    
    @Published var currentScore: Int = 0
    @Published var preferences: Preferences {
           didSet {
               preferencesChanged()
           }
       }
       
    
    init() {
        let initialPreferences = Preferences(language: .english, numberOfLetters: .five)
                self.preferences = initialPreferences
                self.scramble = Scramble(preferences: initialPreferences)
    }
    
    func submitWord() {
        guard scramble.isCurrentWordValid else { return }
        
       
        scramble.foundWords.append(scramble.currentWord)
        
        // Update the score based on the word length
        let wordScore = scramble.currentWord.count
        scramble.score += wordScore
        
        // Check if the word is a pangram and award bonus points if it is
        if Set(scramble.currentWord).count == scramble.letters.count {
            scramble.score += 10
        }
        
        // Clear the current word
        scramble.currentWord = ""
    }
    
    func shuffleLetters() {
        // Get all the letters excluding the center letter
        var lettersToShuffle = scramble.letters.filter { $0 != scramble.centerLetter }
        lettersToShuffle.shuffle()
        
        var shuffledIndex = 0
        for (index, _) in scramble.letters.enumerated() {
            if index != scramble.letters.firstIndex(of: scramble.centerLetter!) { // Exclude the center letter based on its position
                scramble.letters[index] = lettersToShuffle[shuffledIndex]
                shuffledIndex += 1
            }
        }
    }



    func addLetter(_ letter: Character) {
        scramble.currentWord.append(letter)
    }
    func deleteLastLetter() {
           _ = scramble.currentWord.popLast()
       }
    
    func startNewGame() {
        scramble = Scramble(preferences: preferences)
    }
    
    func preferencesChanged() {
        
        scramble = Scramble(preferences: preferences)
    }
    func wordsStats() -> [Character: [Int: Int]] {
        var stats: [Character: [Int: Int]] = [:]
        
        for word in Words.englishWords {
            let firstLetter = word.first!
            let length = word.count
            
            if stats[firstLetter] == nil {
                stats[firstLetter] = [:]
            }
            
            stats[firstLetter]![length, default: 0] += 1
        }
        
        
        for (letter, lengths) in stats {
            stats[letter] = lengths.filter { $0.value > 0 }
        }
        
        return stats
    }

    var hints: (totalWords: Int, totalPoints: Int, pangrams: Int, wordLengths: [Int: Int], startingLetters: [Character: [Int: Int]]) {
        var totalWords = 0
        var totalPoints = 0
        var pangrams = 0
        var wordLengths: [Int: Int] = [:]
        var startingLetters: [Character: [Int: Int]] = [:]

        let validWords = Words.englishWords // Change this based on the selected language

        for word in validWords {
            if word.contains(scramble.centerLetter!) && word.allSatisfy({ scramble.letters.contains($0) }) {
                totalWords += 1

                // Calculate points for the word
                if word.count == 4 {
                    totalPoints += 1
                } else {
                    totalPoints += word.count
                    if word.count == scramble.letters.count {
                        pangrams += 1
                        totalPoints += 10
                    }
                }

                // Update word lengths dictionary
                wordLengths[word.count, default: 0] += 1
                
                // Update starting letters dictionary
                let firstLetter = word.first!
                startingLetters[firstLetter, default: [:]][word.count, default: 0] += 1
            }
        }
        
        return (totalWords, totalPoints, pangrams, wordLengths, startingLetters)
    }

  

}
