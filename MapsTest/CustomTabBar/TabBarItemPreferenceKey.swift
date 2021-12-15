import SwiftUI

struct TabBarItemPreferenceKey: PreferenceKey {

    static var defaultValue = [TabBarItem]()
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}

struct TabBarItemViewModifier: ViewModifier {
    
    let tab: TabBarItem
    
    func body(content: Content) -> some View {
        content
            .preference(key: TabBarItemPreferenceKey.self, value: [tab])
    }
}

extension View {
    
    func tabBarItem(tab: TabBarItem) -> some View {
        modifier(TabBarItemViewModifier(tab: tab))
    }
}
