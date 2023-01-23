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
            
            SavedMessages()
                .tabItem{
                    Image(systemName: "star.fill")
                }
            
            SettingsView()
                .tabItem{
                    Image(systemName: "gear")
                }
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .environmentObject(PeopleViewModel())

    }
}
