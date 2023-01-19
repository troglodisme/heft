//
//  heftApp.swift
//  heft
//
//  Created by Giulio on 13/01/23.
//

import SwiftUI

@main
struct heftApp: App {
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .environmentObject(PeopleViewModel())
            
//            GTP3View()
        }
    }
}
