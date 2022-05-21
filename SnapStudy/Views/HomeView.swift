/*
 Home Page Layout:
 
 Includes flashcards for practicing selected
 language. More options for further updates.
*/

import SwiftUI

struct HomeView: View {
    
    
    // State variables for dragging flashcard state
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    
    var body: some View {
        
        // Variables for long pressing and dragging flashcards
        
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                offset = .zero
                isDragging = false
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        VStack{
            Text("Home Page")
                .onTapGesture {
                    print("Text Tapped")
                }
        }
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
