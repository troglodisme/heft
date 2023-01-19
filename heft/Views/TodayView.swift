//
//  Today.swift
//  heft
//
//  Created by Giulio on 13/01/23.
//

import SwiftUI

struct TodayView: View {
    
    @StateObject private var peopleModel = PeopleViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                VStack {
                   TitleText(text: "Today's Birthday")
                    VStack{
                            HStack{
                                Spacer()
                                Image("person")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                Spacer()
                            }
                            BodyText(text: "It’s Helen's 27th birthday!")
                            Button(action:{
                                
                            }) {
                                Text("Send Wishes!")
                            }
                            .padding(.horizontal, 50)
                            .padding(.vertical, 15)
                            .background(Color("ButtonColor"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        .padding()
                        .frame(maxWidth: 300)
                        .background(Color.white)
                        .cornerRadius(10)
                        .transition(.scale)
                        .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(.black), lineWidth: 2, antialiased: true))
                }
                    //This should be filtered by date
                    //                PeopleView(peopleModel: PeopleObservableObject())
            }
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
