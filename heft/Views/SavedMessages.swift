//
//  SwiftUIView.swift
//  heft
//
//  Created by Giulio on 23/01/23.
//

import SwiftUI

struct SavedMessages: View {
    
    @EnvironmentObject var cardsVM: CardsViewModel
    
    var card: Card
        
    var body: some View {
        
                Text(card.message ?? "Unknown Message")
   
        .padding()
        
    }
    
}

//struct SavedMessages_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedMessages(card: Card)
//            .environmentObject(CardsViewModel())
//    }
//}
