/*
 This file shows how the cards will be displayed on
 the app UI.
*/

import SwiftUI

struct CardView: View {
    
    // Defining the card
    let card: Card
    
    // Variable to show/hide answer
    @State private var isShowingAnswer = false
    
    var body: some View {
        
        // The card is displayed in the ZStack
        ZStack {
            
            // The card layout and styling
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.blue)
                .padding()
                .shadow(radius: 10)
            
            VStack {
                
                // The prompt
                Text(card.prompt)
                    .font(.largeTitle)
                
                // The answer
                if isShowingAnswer {
                Text(card.answer)
                    .font(.headline)
                }
                
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .frame(minWidth: 250, idealWidth: 300, maxWidth: 350, minHeight: 200, idealHeight: 250, maxHeight: 300, alignment: .center)
        .onTapGesture {
            isShowingAnswer.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
