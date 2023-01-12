//
//  ContentView.swift
//  heft
//
//  Created by Giulio on 12/01/23.
//

import SwiftUI

struct Person {
    let id = UUID()
    var name: String
    var birthDate: Date
        
//    var photo: String
//    var daysRemaining: Int
}


struct PeopleView: View {
    
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



struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}

