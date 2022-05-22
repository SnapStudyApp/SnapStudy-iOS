/*
 File to define, abstract, and manipulate flashcards
*/

import Foundation

struct Card {
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "犬", answer: "Dog")
}
