//
//  CustomTabBarItemView2.swift
//  TabbarExample
//
//  Created by Sezer Tunca on 12/12/2021.
//

import SwiftUI

struct CustomTabBarItemView: View {
    
    let tab: TabBarItem
    @Binding var selection: TabBarItem
    
    var body: some View {
        VStack {
            Image(tab.icon)
                .renderingMode(.template)
                .foregroundColor(.gray)
                .font(.subheadline)
//            Text(tab.title)
//                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == tab  ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if selection == tab {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(tab.color.opacity(0.2))
                }
            }
        )
    }
}

struct CustomTabBarItemView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarItemView(tab: .home, selection: .constant(.home))
    }
}
