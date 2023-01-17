//
//  Model.swift
//  heft
//
//  Created by Giulio on 13/01/23.
//
 import Foundation

 struct Person {
    
    let id = UUID()
    var name: String
    var birthDate: Date
     
     var age: Int {
         let calendar = Calendar.current
         let today = Date()
         let ageComponent = calendar.dateComponents([.year], from: birthDate, to: today)
         return ageComponent.year!
 }
     
//    var photo: String
//    var daysRemaining: Int
    
}
