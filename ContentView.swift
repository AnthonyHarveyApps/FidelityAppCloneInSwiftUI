//
//  ContentView.swift
//  SWIFTUI FIDELITY
//
//  Created by Anthony Harvey on 6/10/21.
//

import SwiftUI

struct ContentView: View {
    @State var showVirtualAssistant: Bool = false
    
    var body: some View {
        TabView {
        
            
            FeedView( showVirtualAssistant: $showVirtualAssistant)
                .tabItem {
                    Label("Feed", systemImage: "rectangle.stack")
                }
            
            
            AccountsView(showVirtualAssistant: $showVirtualAssistant)
                .tabItem {
                    Label("Accounts", systemImage: "briefcase")
                }
            
            WatchlistView( showVirtualAssistant: $showVirtualAssistant)
                .tabItem {
                    Label("Watch Lists", systemImage: "eye")
                }
            
            
            TransactView(showVirtualAssistant: $showVirtualAssistant)
                .tabItem {
                    Label("Transact", systemImage: "dollarsign.square")
                }
            
            
            MoreView()
                .tabItem {
                    Label("Watch Lists", systemImage: "ellipsis")
                }
            
            
            
            
        }.opacity(0.8)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
