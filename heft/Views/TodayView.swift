//
//  Today.swift
//  heft
//
//  Created by Giulio on 13/01/23.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(.white))
                        .frame(height: 250)
                        .cornerRadius(10)
                        .padding(.horizontal)
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
                        
                        Text ("It’s Helen's 27th birthday! ")
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
            .navigationTitle("Today")
            
            
        }
        
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
