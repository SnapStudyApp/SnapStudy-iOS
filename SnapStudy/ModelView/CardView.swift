/*
 This file shows how the cards will be displayed on
 the app UI.
*/

import SwiftUI

struct CardView: View {
    
    // Defining the card
    let card: Card
    
    // Removing the card when swiped
    var removal: (() -> Void)? = nil
    
    // Variable to show/hide answer
    @State private var isShowingAnswer = false
    
    // Variable for card offset
    @State private var offset = CGSize.zero
    
    var body: some View {
        
        // The card is displayed in the ZStack
        ZStack {
            
            // The card layout and styling
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    .blue
                        .opacity(1 - Double(abs(offset.width / 25)))
                )
                .background(
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(offset.width > 0 ? .green : .red)
                )
                .shadow(radius: 2)
            
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
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged {gesture in
                    offset = gesture.translation
                }
                .onEnded {_ in
                    if abs(offset.width) > 100 {
                        // Removes card if offset is greater than 100
                        removal?()
                    } else {
                        // Otherwise returns the card to the center
                        offset = .zero
                    }
                }
        )
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
