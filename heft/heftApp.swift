//
//  heftApp.swift
//  heft
//
//  Created by Giulio on 13/01/23.
//

import SwiftUI

@main
struct heftApp: App {
    
//    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .environmentObject(PeopleViewModel())
                .environmentObject(CardsViewModel())
//                .environment((\.managedObjectContext), dataController.container.viewContext)
//            GTP3View()
        }
    }
}
