//
//  BirthdayOne.swift
//  heft
//
//  Created by Suyash Lunawat on 24/01/23.
//

import SwiftUI

struct BirthdayOne: View {
    @ObservedObject var generatorVM = GeneratorViewModel()
    @EnvironmentObject var cardsModel: CardsViewModel
    @EnvironmentObject var peopleModel: PeopleViewModel
    
    var selectedPersonName: String
    var selectedPersonAge: Int
    
    var messageTypes = ["Happy message", "Sad message", "Poetic message", "Long message"]
    @State private var selectedMessageType = "Happy"
    
    var body: some View {
        VStack{
            
            Text("What type of birthday message would you like to send to \(selectedPersonName)?")
                .font(.title3)
            
            Picker("Message tone", selection: $selectedMessageType) {
                ForEach(messageTypes, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.wheel)
            
            Spacer()
            
            
            NavigationLink(destination: BirthdayTwo(selectedPersonName: selectedPersonName, selectedPersonAge: selectedPersonAge)) {
                Button("Generate Now") {
                    Task {
                        await generatorVM.getBirthdayMessage(personName: selectedPersonName,
                                                             personAge: selectedPersonAge,
                                                             messageType: selectedMessageType)
                    }
                }
                    .padding()
                
            
            .buttonStyle(.borderedProminent)
            }
            
            
        }
    }
}

struct BirthdayOne_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayOne(selectedPersonName: "Bob", selectedPersonAge: 25)
    }
}
