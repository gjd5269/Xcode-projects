import Foundation

struct Scramble {
    var letters: [Character]
    var foundWords: [String] = []
    var currentWord: String = ""
    var score: Int = 0
    var centerLetter: Character?
    var preferences: Preferences
    
    init(preferences: Preferences) {
        self.preferences = preferences
        self.letters = Scramble.generateRandomLetters(count: preferences.numberOfLetters.rawValue)
        self.centerLetter = letters[0]
     
    }
    
    static func generateRandomLetters(count: Int) -> [Character] {
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
        var selectedLetters: [Character] = []
        
        while selectedLetters.count < count {
            if let randomLetter = alphabet.randomElement(), !selectedLetters.contains(randomLetter) {
                selectedLetters.append(randomLetter)
            }
        }
        
        return selectedLetters
    }
    
    var isCurrentWordValid: Bool {
        // Ensure the center letter is in the current word
        guard let center = centerLetter, currentWord.contains(center) else {
            return false
        }
        
        // Check word validity based on language preference
        switch preferences.language {
        case .english:
            return Words.englishWords.contains(currentWord.lowercased())
        case .french:
            // Assuming you have a similar structure for French words
            return FrenchWords.frenchWords.contains(currentWord.lowercased())
        case .german:
            return GermanWords.germanWords.contains(currentWord.lowercased())
        case .italian:
            return ItalianWords.italianWords.contains(currentWord.lowercased())
        }
    }
    
    // Add methods or computed properties to generate hints
    // Placeholder:
    var hints: [String] {
        // Generate and return hints based on the current letters and found words
        return []
    }
}
