import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    let content: Content
    @State private var tabs = [TabBarItem]()
    @State private var selectedTab: TabBarItem = .empty
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
        if let tabs = content() as? [TabBarItem],
           let first = tabs.first  {
            self.selectedTab = first
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content.ignoresSafeArea()
            CustomTabBarView(tabs: tabs, selection: $selectedTab)
        }
        .onPreferenceChange( TabBarItemPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
                
        CustomTabBarContainerView {
            Color.red
        }
    }
}
