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
            
            VStack{
                Text("filter by:")
            }
            
            List {
                
                ForEach(peopleModel.people, id: \.id) { person in
                    
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
                                                        
                            // Text(person.birthDate.formatted(.dateTime.day().month().year()) )
                            
                            Text("\(person.age + 1) years old on \(person.birthDate.formatted(.dateTime.day().month()))")
                            }
                        Spacer()
                        
                        Text("\(person.countdownDays)")
                            .backgroundStyle(.red)
                            .foregroundColor(.red)
                    }
                }
            }
  
        }
    }
}



struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
            .environmentObject(PeopleViewModel())
    }
}

