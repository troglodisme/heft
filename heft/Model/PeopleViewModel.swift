//
//  ViewModel.swift
//  heft
//
//  Created by Giulio on 13/01/23.
//

import Foundation


class PeopleObservableObject: ObservableObject {
    
    @Published var message: String = "yo"
    
    //To Do: Add variable for age (to be calculated)
    @Published var people: [Person] = [Person(name: "John Doe", birthDate: Date.distantPast),
                                       Person(name: "Jane Smith", birthDate: Date.distantPast),
                                       Person(name: "Bob Johnson", birthDate: Date.now)
    ]
    
    //To Do: Add function to calculate age
    
    
    
}


////Ahmed example
///
//class ParentObservableObject: ObservableObject {
//    private let messages: [String] = ["Hello", "Ciao", "Ola"]
//
//    /// `@Published` creates an implicit Publisher that announces any changes made to the variable.
//    /// `@Published` can only be used in classes, not structs.
//    @Published var message: String = "Hi"
//
//    func updateMessage() {
//        // Some logic here eg a network request.
//        // After the logic is complete, update the message with the new one.
//        message = messages.randomElement()!
//    }
//}




