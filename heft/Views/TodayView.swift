//
//  Today.swift
//  heft
//
//  Created by Giulio on 13/01/23.
//

import SwiftUI

struct TodayView: View {
    
    @EnvironmentObject private var peopleModel: PeopleViewModel
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                ScrollView(.horizontal){
                    HStack{
                        TodayCard()
                    }
                }
                
                Spacer()
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
