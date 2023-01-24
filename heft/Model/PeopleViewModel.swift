//
//  ViewModel.swift
//  heft
//
//  Created by Giulio on 13/01/23.
//

import Foundation

class PeopleViewModel: ObservableObject {
    
    @Published var message: String = "yo"
    
    //To Do: Add variable for age (to be calculated)
    @Published var people: [Person] = [Person(name: "John Doe", birthDate: Date.distantPast),
                                       Person(name: "Jane Smith", birthDate: Date.distantPast),
                                       Person(name: "Bob Johnson", birthDate: Date.distantPast),
                                       Person(name: "John Doe", birthDate: Date.distantPast),
                                       Person(name: "Jane Smith", birthDate: Date.distantPast),
                                       Person(name: "Bob Johnson", birthDate: Date.now)
    ]
    
    //To Do: Add function to calculate age
    
    
    
}
