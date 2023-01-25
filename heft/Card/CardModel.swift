//
//  Messages.swift
//  heft
//
//  Created by Giulio on 23/01/23.
//

import Foundation

struct Card {
    
    let id = UUID()
    var person: Persona
    var message: String  //Store messages here
    var wasMessageSent: Bool
    
    
    
}
