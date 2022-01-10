import SwiftUI

struct TabBarView: View {
    
    @State var selectedIndex = 0
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedIndex) {
                HomeView()
                    .tag(0)
                DiscoveryView()
                    .tag(1)
                BookView()
                    .tag(2)
            }
            HStack {
                Group {
                    Button { self.selectedIndex = 0 } label: {
                        Image("iconTabBarHome")
                            .renderingMode(.template)
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    Button { self.selectedIndex = 1 } label: {
                        Image("iconTabBarConnect")
                            .renderingMode(.template)
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    Button { self.selectedIndex = 2 } label: {
                        Image("iconTabBarBook01")
                            .renderingMode(.template)
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                }
                
                .padding(.horizontal)
                .padding(.vertical, 5)
            }
            .padding(6)
            .background(Color.white.ignoresSafeArea(edges: .bottom))
            .cornerRadius(30)
            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
            .padding(.horizontal, 70)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
