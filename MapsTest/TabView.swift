//
//  TabView.swift
//  MapsTest
//
//  Created by Sezer Tunca on 08/12/2021.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "triangle")
                }
        
            DiscoveryView()
                .tabItem {
                    Image(systemName: "diamond")
                }
            
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
