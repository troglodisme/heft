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
            
            
            Text("// This view should be a list displaying the same people contained in 'people' but ordered by date. Displaying the first few upcoming birthdays first.")
                .padding()
            
                .navigationBarTitle("Today")
        }
        
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
