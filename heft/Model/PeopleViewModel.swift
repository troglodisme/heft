//
//  ViewModel.swift
//  heft
//
//  Created by Giulio on 13/01/23.
//

import Foundation
import CoreData

class PeopleViewModel: ObservableObject {
    
    
    @Published var message: String = "yo"
    
    //To Do: Add variable for age (to be calculated)
    @Published var people: [Person] = [
        
//        Person(name: "John Doe", birthDate: Date.init(timeIntervalSinceNow: -989200)),
//        Person(name: "Jane Smith", birthDate: Date.init(timeIntervalSinceNow: -1234567)),
//        Person(name: "Bob Johnson", birthDate: Date.init(timeIntervalSinceNow: -2000000)),
//        Person(name: "John Doe", birthDate: Date.now),
//        Person(name: "Jane Smith", birthDate: Date.init(timeIntervalSinceNow: -1000000000)),
//        Person(name: "Bob Johnson", birthDate: Date.now)
    ]
    
    //To Do: Add function to calculate age
    
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
            newPerson.birthDate = Date()
    //        newPerson.surname = surname
    //        newPerson.shortBio = shortBio
    //        newPerson.age = Int64(age)
            saveChanges()
        }

    //    func updateLearner(person: Person) {
    //        let currentSurname = learner.surname ?? ""
    //        let newSurname = currentSurname + "!"
    //        learner.surname = newSurname
    //        saveChanges()
    //    }

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
