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
    var birthDate =  Date()
     
     var age: Int {
         let calendar = Calendar.current
         let today = Date()
         let ageComponent = calendar.dateComponents([.year], from: birthDate, to: today)
         return ageComponent.year!
 }
     
     var countdownDays: Int {
         let calendar = Calendar.current
         let today = Date()
         let components = calendar.dateComponents([.year], from: today)
         let currentYear = components.year!
         let birthMonth = calendar.dateComponents([.month], from: birthDate)
         let birthDay = calendar.dateComponents([.day], from: birthDate)
         let birthdayThisYear = calendar.date(from: DateComponents(year: currentYear, month: birthMonth.month, day: birthDay.day))!
         let daysRemaining = calendar.dateComponents([.day], from: today, to: birthdayThisYear)
         let possibleDays = daysRemaining.day!

         if possibleDays >= 0 {
             return daysRemaining.day! // <1>
         }
         else {
             return 365 + possibleDays
         }

     }
     
//    var photo: String
//    var daysRemaining: Int
    
}
