/*
 Home Page Layout:
 
 Includes flashcards for practicing selected
 language. More options for further updates.
*/

import SwiftUI
import CoreHaptics

// Extension for making card stack
extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }
}

struct HomeView: View {
    
    // Variable for repeating flashcards
    
    @State private var cards = Array<Card>(repeating: Card.example, count: 10)
    
    var body: some View {
        ZStack{
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) {index in
                        CardView(card: cards[index]) {
                            withAnimation {
                                removeCard(at: index)
                            }
                        }
                        .stacked(at: index, in: cards.count)
                    }
                }
            }
        }
    }
    
    // Function to remove cards when swiped
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
