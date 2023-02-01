//
//  ListSavedMessageView.swift
//  heft
//
//  Created by Giulio on 24/01/23.
//

import SwiftUI

struct ListSavedMessageView: View {
    @EnvironmentObject var cardsVM: CardsViewModel
    
    var body: some View {
        NavigationStack{
            
            List{
                
                ForEach(cardsVM.messages) { card in

                    NavigationLink(destination: SavedMessages(card: card)) {
                        Text(card.person ?? "Unknown Name")
                    }

                }


            }
            .navigationTitle("Saved Messages")
        }
    }
}

//struct ListSavedMessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListSavedMessageView()
//    }
//}
