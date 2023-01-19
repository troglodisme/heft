

import SwiftUI

struct GTP3View: View {
    
    @ObservedObject var generatorVM = GeneratorViewModel()
    
    var body: some View {
        NavigationStack {
         
            VStack(alignment: .leading) {
                
                if let message = generatorVM.generatedMessage {
                    
                    Text("Birthday Message: ")
                        .font(.headline)

                    Text(message)

                } else {
                    Text("No Learner yet...")
                }

                Spacer()
                
                //Get Birthday Message
                
                Button {
                    Task {
                        await generatorVM.getBirthdayMessage()
                    }
                    
                } label: {
                    buttonLabel(with: "Generate message",
                                and: .accentColor)
                }
                
                
            }
            .padding()
            .navigationTitle("BirthdayCard")
        }
    }
    
    @ViewBuilder
    func buttonLabel(with text: String, and color: Color) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .frame(height: 55)
                .foregroundColor(color)
            Text(text)
                .foregroundColor(.white)
        }
    }
}

struct GTP3View_Previews: PreviewProvider {
    static var previews: some View {
        GTP3View()
    }
}

