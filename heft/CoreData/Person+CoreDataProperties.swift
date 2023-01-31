//
//  Person+CoreDataProperties.swift
//  heft
//
//  Created by Suyash Lunawat on 25/01/23.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var birthDate: Date?
    
    public var age: Int {
        let calendar = Calendar.current
        let today = Date()
        let ageComponent = calendar.dateComponents([.year], from: birthDate ?? Date(), to: today)
        return ageComponent.year!
    }
    
    public var countdownDays: Int {
        let calendar = Calendar.current
        let today = Date()
        let components = calendar.dateComponents([.year], from: today)
        let currentYear = components.year!
        let birthMonth = calendar.dateComponents([.month], from: birthDate ?? Date())
        let birthDay = calendar.dateComponents([.day], from: birthDate ?? Date())
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
    
    
//    public var birthdateString : String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM"
//        let birthDateString = dateFormatter.string(from: birthDate ?? Date())
//        
//        return birthDateString
//    }

}

extension Person : Identifiable {

}
