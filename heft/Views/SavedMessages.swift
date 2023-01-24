//
//  SwiftUIView.swift
//  heft
//
//  Created by Giulio on 23/01/23.
//

import SwiftUI

struct SavedMessages: View {
    
    @EnvironmentObject var cardsVM: CardsViewModel
    
    var body: some View {
        
        List{
            
            ForEach(cardsVM.messages, id: \.id) { card in
                
                Text(card.message)
            }
        }
                
        .padding()
        
    }
    
}

//struct SavedMessages_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedMessages()
//    }
//}
