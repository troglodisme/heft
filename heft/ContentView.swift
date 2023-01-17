//
//  ContentView.swift
//  heft
//
//  Created by Giulio on 13/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView() {
            TodayView()
                .tabItem{
                    Image(systemName: "house.fill")
                }
            
            PeopleView()
//            PeopleView(peopleModel: PeopleObservableObject())
                .tabItem{
                    Image(systemName: "person.fill")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PeopleObservableObject())

    }
}
