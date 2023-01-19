

import SwiftUI

struct GPT3View: View {
    
    @ObservedObject var generatorVM = GeneratorViewModel()
    @EnvironmentObject var peopleModel: PeopleViewModel

    var body: some View {
        NavigationStack {
         
            VStack(alignment: .leading) {
                
                if let message = generatorVM.generatedMessage {
                    
                    Text("Birthday Message: ")
                        .font(.headline)

                    Text(message)
                    
                } else {
                    Text("No message yet...")
                }

                Spacer()
                
                //Get Birthday Message
                
                Button {
                    Task {
                        await generatorVM.getBirthdayMessage()
                    }
                    
                } label: {
                    Text("Generate message")
                }
                
                
            }
            .padding()
            .navigationTitle("BirthdayCard")
        }
    }
    
//    @ViewBuilder
//    func buttonLabel(with text: String, and color: Color) -> some View {
//        ZStack{
//            RoundedRectangle(cornerRadius: 12)
//                .frame(height: 55)
//                .foregroundColor(color)
//            Text(text)
//                .foregroundColor(.white)
//        }
//    }
}

struct GPT3View_Previews: PreviewProvider {
    static var previews: some View {
        GPT3View()
    }
}

