//
//  SettingsView.swift
//  heft
//
//  Created by Giulio on 23/01/23.
//

import SwiftUI

struct SettingsView: View {
    

    
//    @Environment (\.dismiss) var dismiss
    
    @State private var darkmode = true
    @State private var money = 0
    @State private var showNotif = true
    @State var doneIsPresented: Bool = false
    @State var backIsPresented: Bool = false
    
    private var paymentMethods = [ "Credit Card", "Debit Card", "PayPal", "Apple Pay"]
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
             
                    Toggle("DarkMode", isOn: $darkmode)
                    Toggle("Notification", isOn: $showNotif)
                    Picker (selection: $money, label: Text("Payment")) {
                        ForEach(0 ..< paymentMethods.count, id: \.self) {
                            Text(self.paymentMethods[$0])
                        }
                    }
                    
                }
                
                .navigationTitle("Setting")
                .navigationBarTitleDisplayMode(
                    .inline)
                
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button ("Done") {
//                            dismiss()
//
//                       
//                        }
//                    }
//                }
//                
//
//                
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Button { dismiss() }
//                    label: { Image(systemName: "chevron.backward") }
//                        
//                    }
//                }
            }
            .accentColor(.black)
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
