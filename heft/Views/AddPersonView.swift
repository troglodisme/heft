//
//  ContentView.swift
//  SwiftPlus
//
//  Created by Giulio Ammendola on 12/01/23.
//

import SwiftUI

struct AddPersonView: View {
    
    @Environment(\.dismiss) var dismiss
//    @Environment(\.managedObjectContext) var moc
    
    
    @EnvironmentObject var peopleModel: PeopleViewModel

    @State private var birthday = Date()
    @State private var name: String = ""
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                //Name
                VStack(alignment: .leading) {
                    
                    Text("Name")
                        .font(.title)
                    
                    HStack {
                        TextField(
                            "Enter full name",
                            text: $name,
                            onCommit: {
                                print(self.name)
                            }
                        )
                        Image(systemName: "x.circle.fill")
                        
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            
            Spacer()
            
            //Calendar
            VStack(alignment: .leading) {
                
                Text("Birthday")
                    .font(.title)
                
                DatePicker("Enter your birthday", selection: $birthday, displayedComponents: [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
            }
            
            Spacer()
            Spacer()
            
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
                            print("done tapped!")
                            dismiss()
                            
                            //move presentation logic to view model
//                            let newPerson = Person(context: moc)
//                            newPerson.id = UUID()
//                            newPerson.name = name
//                            newPerson.birthDate = birthday
//                            print(newPerson)
//                            moc.people.append(newPerson)
                            
                            peopleModel.addNewPerson(name: name, birtDate: birthday)
                        
                            
                        
//                                try? moc.save()
                            
                           
                        }
                    }
                }
            
        }
        .padding()
        
    }
}

//struct AddPersonView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPersonView()
//    }
//}


