

import SwiftUI

struct GPT3View: View {
    
    @ObservedObject var generatorVM = GeneratorViewModel()
    
    @EnvironmentObject var peopleModel: PeopleViewModel
    
    //Create variables to receive the selected person
    var selectedPersonName: String
    var selectedPersonAge: Int

    var body: some View {
        
        
        NavigationStack {
         
            VStack(alignment: .leading) {
                
                if let message = generatorVM.generatedMessage {
                    
                    Text("Birthday Message: ")
                        .font(.headline)

                    Text(message)
                    
//                    TextField("Enter your message type", text: $selectedMessageType)
                    
                } else {
                    Text("No message yet...")
                }

                Spacer()
                
                //Get Birthday Message
                
                Button {
                    
                    Task {
                        await generatorVM.getBirthdayMessage(personName: selectedPersonName,
                                                             personAge: selectedPersonAge)
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

//struct GPT3View_Previews: PreviewProvider {
//    static var previews: some View {
//        GPT3View()
//    }
//}

