//
//  Card+CoreDataProperties.swift
//  heft
//
//  Created by Suyash Lunawat on 26/01/23.
//
//

import Foundation
import CoreData


extension Card {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var person: String?
    @NSManaged public var message: String?

}

extension Card : Identifiable {

}
