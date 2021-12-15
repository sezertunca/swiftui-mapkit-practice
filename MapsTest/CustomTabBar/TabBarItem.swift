import SwiftUI

enum TabBarItem: Hashable {
    
    case empty, home, connect, book
    
    var icon: String {
        switch self {
        case .empty:
            return ""
        case .home:
            return "iconTabBarHome"
        case .connect:
            return "iconTabBarConnect"
        case .book:
            return "iconTabBarBook01"
        }
    }
    
    var title: String {
        switch self {
        case .empty:
            return ""
        case .home:
            return "Home"
        case .connect:
            return "Favourites"
        case .book:
            return "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .empty:
            return .clear
        case .home:
            return .gray
        case .connect:
            return .gray
        case .book:
            return .gray
        }
    }
}
