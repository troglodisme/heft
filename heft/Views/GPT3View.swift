

import SwiftUI

struct GPT3View: View {
    
    @ObservedObject var generatorVM = GeneratorViewModel()
    
    @EnvironmentObject var peopleModel: PeopleViewModel
    
    //Create variables to receive the selected person
    var selectedPersonName: String
    var selectedPersonAge: Int
    
    var messageTypes = ["Happy", "Sad", "Poetic", "Long"]
    @State private var selectedMessageType = "Happy"
    
    var body: some View {
        
        
        NavigationStack {
            
            
  
            VStack(alignment: .leading) {
                
                HStack{
                    
                    Text("Write a ")
                        .font(.headline)
                    
                    VStack {
                        Picker("Please choose a message type", selection: $selectedMessageType) {
                            ForEach(messageTypes, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    
                    Text("Birthday message")
                        
                }
                

                

                    
                if let message = generatorVM.generatedMessage {
                    

                    
                    Text(message)
                    
                        
                    } else {
                        Text("No message yet...")
                    }
                    
                    Spacer()
                    
                
                    //Get Birthday Message
                    
                    Button {
                        
                        Task {
                            await generatorVM.getBirthdayMessage(personName: selectedPersonName,
                                                                 personAge: selectedPersonAge,
                                                                 messageType: selectedMessageType)
                        }
                        
                    } label: {
                        Text("Generate message")
                    }
                    
                    
                }
                    .padding()
                    .navigationTitle("BirthdayCard")
            }
        }
        
    }


//    struct GPT3View_Previews: PreviewProvider {
//        static var previews: some View {
//            GPT3View()
//        }
//    }
//
