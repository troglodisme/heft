//
//  Today.swift
//  heft
//
//  Created by Giulio on 13/01/23.
//

import SwiftUI

struct TodayView: View {
    
    @EnvironmentObject private var peopleModel: PeopleViewModel
    
    @FetchRequest(sortDescriptors: [], predicate: nil) var persons: FetchedResults<Person>
    
    @State private var isSheetShowing = false

    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                ScrollView(.horizontal) {
                    
                    HStack { 
                        TodayCard()
                    }
                
                }
                                
                PeopleView()

            }
            .navigationTitle("Today")
              
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isSheetShowing.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $isSheetShowing) {
                        
                        AddPersonView()
                        
                    }
                }
            }
            
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
            .environmentObject(PeopleViewModel())
    }
}
