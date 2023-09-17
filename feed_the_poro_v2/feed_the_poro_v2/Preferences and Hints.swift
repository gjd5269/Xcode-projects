enum Language: String, CaseIterable, Identifiable {
    case english = "English"
    case french = "French"
    case italian = "Italian"
    case german = "German"
    
    var id: String { self.rawValue }
}

enum NumberOfLetters: Int, CaseIterable, Identifiable {
    case five = 5
    case six = 6
    case seven = 7
    
    var id: Int { self.rawValue }
}

struct Preferences {
    var language: Language
    var numberOfLetters: NumberOfLetters
}
