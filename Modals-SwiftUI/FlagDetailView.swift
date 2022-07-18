//
//  FlagDetailView.swift
//  Modals-SwiftUI
//
//  Created by Mitya Kim on 7/18/22.
//

import SwiftUI

struct FlagDetailView: View {
    
    @Binding var flagVM: FlagViewModel
    
    var body: some View {
       
        VStack {
            
            Text(self.flagVM.flag)
                .font(.custom("Arial", size: 100))
            
            TextField(text: self.$flagVM.country) {
                Text("Enter country name")
            }
            .padding()
            .fixedSize()
            
            Button("Submit") {
                self.flagVM.showModal.toggle()
                
            }
        }
    }
}

struct FlagDetailView_Previews: PreviewProvider {
   
    static var previews: some View {
        FlagDetailView(flagVM: .constant(FlagViewModel()))
    }
}
