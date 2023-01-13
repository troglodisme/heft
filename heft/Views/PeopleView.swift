//
//  ContentView.swift
//  heft
//
//  Created by Giulio on 12/01/23.
//

import SwiftUI




struct PeopleView: View {
    
    //This should be moved in the model or observable object?
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
                        
                        Image("person2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 65, height: 70)
                            .clipped()
                            .clipShape(Circle())
                            .padding(.trailing, 15)
                        
                        VStack(alignment: .leading) {
                            
                            Text(person.name)
                                .font(.title2)
                                .bold()
                            
                            //To do: Simplify date formatting
                            //To do: Change formatting depending on country locale
                            //To do: Calculate real
                            Text(person.birthDate.formatted(.dateTime.day().month().year()) )
                            
                        }
                    }
                    
                    
                    //                    HStack{
                    //
                    //                        Image(systemName: "person")
                    //                        Text(person.name)
                    //                        Spacer()
                    //
                    //                        //Can we format all dates without having to use this long method?
                    //                        Text(person.birthDate.formatted(.dateTime.day().month().year()) )
                    //
                    //                    }
                    
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

