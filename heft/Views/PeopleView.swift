//
//  ContentView.swift
//  heft
//
//  Created by Giulio on 12/01/23.
//

import SwiftUI


struct PeopleView: View {
    
    //    @ObservedObject var peopleModel: PeopleObservableObject
    @EnvironmentObject var peopleModel: PeopleViewModel
    
    @State private var isSheetShowing = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                    Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                    VStack {
                        HStack{
                            Text("People")
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                            Spacer()
                            Button(action: {
                                isSheetShowing.toggle()
                            }){
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 35))
                                    .foregroundColor(Color("ButtonColor"))
                            }.sheet(isPresented: $isSheetShowing){
                                AddPersonView()
                            }
                        }
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                        Spacer()
                        List {
                            ForEach(peopleModel.people, id: \.id) { person in
                                ZStack {
                                    Section {
                                        HStack{
                                            Image("person2")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 65, height: 70)
                                                .clipped()
                                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                                .padding(.trailing, 15)
                                            VStack(spacing: 5){
                                                NameText(text: person.name)
                                                BirthdayText(date: person.birthDate)
                                            }
                                        }
                                        .frame(width: 334.0, height: 85.0)
                                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 2.0))
                                        .foregroundColor(Color.black)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                    }
                                }
                                .listRowBackground(Color("BackgroundColor"))
                                .listRowSeparator(.hidden)
                            }.onDelete(perform: delete)
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                    }
            }
        }
        }
        
        func delete(at offsets: IndexSet) {
            peopleModel.people.remove(atOffsets: offsets)
        }
    
}


struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
            .environmentObject(PeopleViewModel())
    }
}

