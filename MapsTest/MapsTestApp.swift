//
//  MapsTestApp.swift
//  MapsTest
//
//  Created by Sezer Tunca on 08/12/2021.
//

import SwiftUI

@main
struct MapsTestApp: App {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 244/244, green: 239/239, blue: 234/244, alpha: 1)
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
