//
//  ContentView.swift
//  heft
//
//  Created by Giulio on 12/01/23.
//

import SwiftUI

//This should be moved in the model file
struct Person {
    let id = UUID()
    var name: String
    var birthDate: Date
        
//    var photo: String
//    var daysRemaining: Int
}


struct ContentView: View {
    
    //This should be moved out of here
    @State private var people: [Person] = [Person(name: "John Doe", birthDate: Date.now),
                                           Person(name: "Jane Smith", birthDate: Date.now),
                                           Person(name: "Bob Johnson", birthDate: Date.now)
    ]
    
    @State private var isSheetShowing = false

    var body: some View {
        
        NavigationStack {
            
            List {
                ForEach(people, id: \.id) { person in
                    
                    HStack{
                        
                        Image(systemName: "person")
                        
                        Text(person.name)
                        
                        Spacer()
                        
                        //Can we format all dates without having to use this long method?
                        Text(person.birthDate.formatted(.dateTime.day().month().year()) )

                    }
                }
            }
            .navigationBarTitle("People")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isSheetShowing.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $isSheetShowing) {
                        AddPersonView(people: $people)
                    }
                }
            }
        }
    }
}

struct AddPersonView: View {
        
    @Environment(\.dismiss) var dismiss
    
    @Binding var people: [Person]

    @State private var birthday = Date()
    @State private var name: String = ""

    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                //Name

            
                VStack(alignment: .leading) {
                    
                    Text("Name").font(.title)
                    
                    HStack {
                        TextField(
                          "Hint Text",
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

                            let newPerson = Person(name: name, birthDate: birthday)
                            people.append(newPerson)
                        }
                    }
                }
            
            }
            .padding()
            
        }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

