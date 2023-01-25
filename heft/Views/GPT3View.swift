

import SwiftUI

struct GPT3View: View {
    @Environment(\.managedObjectContext) var moc

    @ObservedObject var generatorVM = GeneratorViewModel()
    
    @EnvironmentObject var peopleModel: PeopleViewModel
    
    @EnvironmentObject var cardsModel: CardsViewModel
    
    //Create variables to receive the selected person
    var selectedPersonName: String
    var selectedPersonAge: Int
    @State var generateButtonIsPressed = false
    
    var messageTypes = ["Happy message", "Sad message", "Poetic message", "Long message"]
    @State private var selectedMessageType = "Happy"
    
    var body: some View {
        
        
        NavigationStack {
            
            VStack() {
                
                
                
                //Display save and share buttons is message is present
                if let messageAvailability = generatorVM.wasMessageGenerated {
                                    
                    //If the message is there
                    
                    
                    
                    if messageAvailability == true {
                        
                        if let message = generatorVM.generatedMessage {
                            
                            VStack{
                                
                                Text(message)
                                    .font(.title3)
                                    .padding()
                                    .background(.orange)
                                    .cornerRadius(10)
                            }
                            


                            
                        }
                        
                        HStack{
                            Button {
                                print("Save Message")
                                let newCard = Card(person: Persona(name: selectedPersonName),
                                                   message: generatorVM.generatedMessage,
                                                   wasMessageSent: false)
  
                                cardsModel.messages.append(newCard)
                                
                                //append message to CardsVIewModel
                                
                            } label: {
                                Text("Save")
                                    .padding()
                            }
                            
                            Text("or")
                            
                            ShareLink(item: "", subject: Text("Share Message"), message: Text(generatorVM.generatedMessage))
                            
                            // Add image renderer https://developer.apple.com/documentation/swiftui/imagerenderer
                        }
                        
                        
                    } else if messageAvailability == false && generateButtonIsPressed == true{
                        ProgressView("Generating Message")
                    }
                    
                    else {
                        
                        
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
                            
                            VStack{
                                Button {
                                    
                                    Task {
                                        generateButtonIsPressed.toggle()

                                        await generatorVM.getBirthdayMessage(personName: selectedPersonName,
                                                                             personAge: selectedPersonAge,
                                                                             messageType: selectedMessageType)
                                    }
                                } label: {
                                    Text("Generate Now")
                                        .padding()
                                    
                                }
                                .buttonStyle(.borderedProminent)
                            }
                            
                            Spacer()
                        }
                        
                        
                    }
                    
                }
                
                
                Spacer()
                
                
                
            }
            .padding()
            .navigationTitle("Birthday Card")
        }
    }
    
}


struct GPT3View_Previews: PreviewProvider {
    static var previews: some View {
        GPT3View(selectedPersonName: "Bob", selectedPersonAge: 5)
            .environmentObject(PeopleViewModel())
            .environmentObject(CardsViewModel())
        
    }
}
//
