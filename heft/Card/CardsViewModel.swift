//
//  MessagesViewModel.swift
//  heft
//
//  Created by Giulio on 23/01/23.
//

import Foundation

class CardsViewModel: ObservableObject {
    
    @Published var messages: [Card] = [Card(message: "Happy Birthday, Bob Johnson! Wishing you a very special day filled with joy and happiness. May this birthday be the start of an amazing year full of wonderful surprises and amazing memories. Have a fantastic day!", wasMessageSent: false)
                                       
    ]
    
}
