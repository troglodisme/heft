//
//  ContentView.swift
//  SwiftPlus
//
//  Created by Giulio Ammendola on 12/01/23.
//

import SwiftUI

struct AddPersonView: View {
    
    @Environment(\.dismiss) var dismiss
    
//    @Binding var people: [Person]
    
    @EnvironmentObject var peopleModel: PeopleObservableObject

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
                            let newPerson = Person(name: name, birthDate: birthday)
                            print(newPerson)
                            peopleModel.people.append(newPerson)
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


