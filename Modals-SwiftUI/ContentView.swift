//
//  ContentView.swift
//  Modals-SwiftUI
//
//  Created by Mitya Kim on 7/18/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showModal: Bool = false
    @State private var selectedFlag: String = ""
    @State private var country: String = ""
    
    let flags = ["🇺🇸", "🇰🇷", "🇻🇳", "🇯🇵", "🇨🇦", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇺🇦", "🇨🇲", "🇹🇲"]
    @State private var flagVM = FlagViewModel()
    
    var body: some View {
        
        List {
            
            
            Text(self.flagVM.country)
            
            ForEach(self.flags, id: \.self) { flag in
                
                HStack {
                    Text(flag)
                        .font(.custom("Arial", size: 100))
                    Spacer()
                }.onTapGesture {
                    self.flagVM.flag = flag
                    self.flagVM.showModal.toggle()
                }
            }
        }.sheet(isPresented: self.$flagVM.showModal) {
            FlagDetailView(flagVM: self.$flagVM)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
