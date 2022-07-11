/*
 List Page Layout:
 
 Includes list of entered words and options to
 enter more words, or edit/delete the current
 list of words.
*/

import SwiftUI

struct ListView: View {
    
    @State private var cards = Array<Card>(repeating: Card.example, count: 10)
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                List(cards) { item in
                    HStack{
                        Text(item.prompt)
                            .padding(.horizontal)
                        Text(item.answer)
                            .padding(.horizontal)
                    }
                }
                Button (action: {}) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add New Flashcard")
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Flashcard List")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
