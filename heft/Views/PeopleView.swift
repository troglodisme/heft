//
//  ContentView.swift
//  heft
//
//  Created by Giulio on 12/01/23.
//

import SwiftUI


struct PeopleView: View {
    @Environment(\.managedObjectContext) var moc
    
    @EnvironmentObject var peopleModel: PeopleViewModel
    @FetchRequest(sortDescriptors: [], predicate: nil) var persons: FetchedResults<Person>

    
    
    
    
    @State private var isSheetShowing = false

    var body: some View {
        
        NavigationStack {
            
            VStack{
                Text("add picker/filter here:")
            }
            
            List {
                
                ForEach(peopleModel.people) { person in
                    
                    HStack{
                                                
                        Image("person2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 65, height: 70)
                            .clipped()
                            .clipShape(Circle())
                            .padding(.trailing, 15)
                        
                        VStack(alignment: .leading) {
                            
                            Text(person.name ?? "Unknown Name")
                                .font(.title2)
                                .bold()
                                                        
                            // Text(person.birthDate.formatted(.dateTime.day().month().year()) )
                            
                            Text("\(person.age + 1) years old on")
//                                 \(person.birthDate?.formatted(.dateTime.day().month()))")
                            }
                        Spacer()
                        
                        Text("\(person.countdownDays)")
                            .backgroundStyle(.red)
                            .foregroundColor(.red)
                    }
                }
                .onDelete(perform: delete)
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

