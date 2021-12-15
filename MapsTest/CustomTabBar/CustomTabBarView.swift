//
//  CustomTabBarView.swift
//  TabbarExample
//
//  Created by Sezer Tunca on 12/12/2021.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem

    var body: some View {
        tabBarVersion
            .padding(.horizontal, 70)
    }
    
    private func select(tab: TabBarItem) {
        withAnimation(.easeInOut) {
            selection = tab
        }
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(tabs: [.home, .connect, .book],
                             selection: .constant(.home))
        }
        
    }
}

extension CustomTabBarView {
        
    private var tabBarVersion: some View {
        HStack {
            ForEach(tabs, id:\.self) { tab in
                CustomTabBarItemView(tab: tab, selection: $selection)
                    .onTapGesture {
                        select(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}

