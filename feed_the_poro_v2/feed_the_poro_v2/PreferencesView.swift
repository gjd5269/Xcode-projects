import SwiftUI



enum Language: String, CaseIterable, Identifiable {
    case english = "English"
    case french = "French"
    case german = "German"
    case italian = "Italian"
    
    var id: String { self.rawValue }
}

enum NumberOfLetters: Int, CaseIterable, Identifiable {
    case four = 5
    case five = 6
    case six = 7
   
    
    var id: Int { self.rawValue }
}

struct Preferences {
    var language: Language
    var numberOfLetters: NumberOfLetters
    
}

struct PreferencesView: View {
    @Binding var preferences: Preferences
    
    var body: some View {
        Form {
            Picker("Language", selection: $preferences.language) {
                ForEach(Language.allCases) { language in
                    Text(language.rawValue).tag(language)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Picker("Number of Letters", selection: $preferences.numberOfLetters) {
                ForEach(NumberOfLetters.allCases) { number in
                    Text("\(number.rawValue)").tag(number)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}
