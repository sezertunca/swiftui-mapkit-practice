//
//  TabView.swift
//  MapsTest
//
//  Created by Sezer Tunca on 08/12/2021.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        CustomTabBarContainerView {
            HomeView()
                .tabBarItem(tab: .home)
        
            DiscoveryView()
                .tabBarItem(tab: .connect)
            
            BookView()
                .tabBarItem(tab: .book)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
