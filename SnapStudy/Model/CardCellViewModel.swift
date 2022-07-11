//
//  CardCellViewModel.swift
//  SnapStudy
//
//  Created by Jomills Jose Anand on 2022-06-09.
//

import Foundation
import UIKit

class CardCellViewModel: ObservableObject, Identifiable {
    @Published var card: Card
    @Published var attempt = 0
    var id = ""
    
    init(card: Card) {
        self.card = card
        
        $card
            .map { card in
                // Have to check if card is swiped right and updated attempt
            }
    }
}
