//
//  ListSavedMessageView.swift
//  heft
//
//  Created by Giulio on 24/01/23.
//

import SwiftUI

struct ListSavedMessageView: View {
    @EnvironmentObject var cardsVM: CardsViewModel
    
    @Environment(\.managedObjectContext) var moc

    var body: some View {
        NavigationStack{
            List{

                ForEach(cardsVM.messages, id:\.id) { card in

                    NavigationLink(destination: SavedMessages(card: card)) {
                        Text(card.person.name)
                    }

                }


            }
            .navigationTitle("Saved Messages")
        }
    }
}

struct ListSavedMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ListSavedMessageView()
    }
}
