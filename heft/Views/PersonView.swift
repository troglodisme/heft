//
//  PersonView.swift
//  heft
//
//  Created by Giulio on 13/01/23.
//

import SwiftUI

struct NameText: View{

    var text: String

    var body: some View{
        Text(text)
            .font(.body)
            .multilineTextAlignment(.leading)
            .foregroundColor(.black)
            .frame(maxWidth: 210, alignment: .leading)
            .bold()
    }
}

struct BirthdayText: View{

    var text: String

    var body: some View{
        Text(text)
            .font(.body)
            .multilineTextAlignment(.leading)
            .foregroundColor(.black)
            .frame(maxWidth: 210, alignment: .leading)
    }
}

struct PersonView: View {
    var body: some View {
        HStack{
                    Image("person2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 65, height: 70)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.trailing, 15)
                    VStack(spacing: 5){
                        NameText(text: "Jane Wilden")
                        BirthdayText(text: "12")
                    }
                }
                    .frame(width: 334.0, height: 85.0)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 2.0))
                    .foregroundColor(Color.black)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.darkGray).edgesIgnoringSafeArea(.all)
            PersonView()
        }
    }
}
