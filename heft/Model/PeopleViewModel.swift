//
//  ViewModel.swift
//  heft
//
//  Created by Giulio on 13/01/23.
//

import Foundation
import CoreData

class PeopleViewModel: ObservableObject {
    
        
    //To Do: Add variable for age (to be calculated)
    @Published var people: [Person] = [
        
    ]
    
    
    init() {
            fetchPeople()
        }
    
    func fetchPeople() {
            let request = NSFetchRequest<Person>(entityName: "Person")
            
            do {
                people = try PersistenceManager.shared.container.viewContext.fetch(request)
            } catch {
                print("Error fetching. \(error)")
            }
        }
    


        func addNewPerson(name: String, birtDate: Date) {
            let newPerson = Person(context: PersistenceManager.shared.container.viewContext)
            newPerson.id = UUID()
            newPerson.name = name
            newPerson.birthDate = birtDate

            saveChanges()
        }

        func deletePerson(person: Person) {
            PersistenceManager.shared.container.viewContext.delete(person)
            saveChanges()
        }

        func deletePerson(offsets: IndexSet) {
            offsets.map { people[$0] }.forEach(PersistenceManager.shared.container.viewContext.delete)
            saveChanges()
        }

        func saveChanges() {
            PersistenceManager.shared.saveContext() { error in
                guard error == nil else {
                    print("An error occurred while saving: (error!)")
                    return
                }
                self.fetchPeople()
            }
        }        
}
