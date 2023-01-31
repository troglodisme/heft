//
//  MessagesViewModel.swift
//  heft
//
//  Created by Giulio on 23/01/23.
//

import Foundation
import CoreData

class CardsViewModel: ObservableObject {
    
    @Published var messages: [Card] = [
        
//        Card(message: "a fake saved message", wasMessageSent: false)
                                       
    ]
   
    func fetchCards() {
            let request = NSFetchRequest<Card>(entityName: "Card")
            
            do {
                messages = try PersistenceManager.shared.container.viewContext.fetch(request)
            } catch {
                print("Error fetching. \(error)")
            }
            
        }
    
    func addNewCard(person: String, message: String) {
        
        let newCard = Card(context: PersistenceManager.shared.container.viewContext)
        newCard.id = UUID()
        newCard.person = person
        newCard.message = message

        print(newCard)
        
        saveChanges()
    }
    
    func saveChanges() {
        PersistenceManager.shared.saveContext() { error in
            guard error == nil else {
                print("An error occurred while saving: (error!)")
                return
            }
            self.fetchCards()
        }
    }
    
}
