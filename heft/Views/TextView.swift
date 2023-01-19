//
//  TextView.swift
//  heft
//
//  Created by Alessandro Airlangga Hariadi on 18/01/23.
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

struct TitleText: View{
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .bold()
            .foregroundColor(.black)
        .multilineTextAlignment(.center)
        
    }
}

struct BodyText: View{
    var text: String
    
    var body: some View{
        Text(text)
            .fontWeight(.semibold)
            .padding()
    }
}





struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            NameText(text: "hello")
            BirthdayText(text: "12 November")
            TitleText(text: "Today's Birthday")
        }
    }
}

