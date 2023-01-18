//
//  TodayCard.swift
//  heft
//
//  Created by Suyash Lunawat on 19/01/23.
//

import SwiftUI

struct TodayCard: View {
    @EnvironmentObject var peopleModel: PeopleViewModel
    
    var body: some View {
        ForEach(peopleModel.people, id: \.id) { person in
            
                ZStack{
                    Rectangle()
                        .foregroundColor(Color(.white))
                        .frame(width: UIScreen.main.bounds.width / 1.10, height: 250)
                        .cornerRadius(10)
                        .padding()
                        .contrast(9.0)
                        .shadow(radius: 10)
                    
                    VStack{
                        HStack{
                            Spacer()
                            Image("person")
                                .resizable()
                                .frame(width: 100, height: 100)
                            Spacer()
                        }
                        
                        
                        
                        Text (person.name)
                            .fontWeight(.semibold)
                            .padding([.leading, .bottom], 20.0)
                        
                        Button {
                            print("Send message")
                        } label: {
                            Text ("Send message!")
                        }
                        .padding()
                        .background(Color(.gray))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    }
                    
                }
            
        }
    }
}

struct TodayCard_Previews: PreviewProvider {
    static var previews: some View {
        TodayCard()
    }
}
