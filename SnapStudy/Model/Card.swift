/*
 File to define, abstract, and manipulate flashcards
*/

import Foundation

struct Card : Identifiable {
    var id: String = UUID().uuidString // Unique ID for each word to make it distinguishable
    let prompt: String // Question
    let answer: String // Answer
    var attempt: Int // Variable to move the card back and forth in the stack
    
    static let example = Card(prompt: "犬", answer: "Dog", attempt: 0)
}
