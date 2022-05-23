/*
 Home Page Layout:
 
 Includes flashcards for practicing selected
 language. More options for further updates.
*/

import SwiftUI
import CoreHaptics

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
