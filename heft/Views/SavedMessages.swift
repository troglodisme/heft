//
//  SwiftUIView.swift
//  heft
//
//  Created by Giulio on 23/01/23.
//

import SwiftUI

struct SavedMessages: View {
    
    @StateObject var cardsVM = CardsViewModel()
    
    var body: some View {
        
        VStack{
            Text(cardsVM.messages[0].message)
                .padding()
        }

        
    }
    
}

struct SavedMessages_Previews: PreviewProvider {
    static var previews: some View {
        SavedMessages()
    }
}
