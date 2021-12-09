import SwiftUI
import MapKit

struct User: Identifiable {
    let id = UUID()
    let fullName: String
    let occupation: String
    let location: String
    let coordinate: CLLocationCoordinate2D
    let imageUrl = "https://picsum.photos/200"
}

struct DiscoveryView: View {
    
    @State var isFullScreen = false
    
    private let todaysPicks: [User] = [
        User(fullName: "Brandon Septimus", occupation: "CTO", location: "Barcelona, Spain", coordinate: .init(latitude: 48.8566, longitude: 2.3522)),
        User(fullName: "Brandon Septimus", occupation: "CTO", location: "Barcelona, Spain", coordinate: .init(latitude: 45.7640, longitude: 4.8357)),
        User(fullName: "Brandon Septimus", occupation: "CTO", location: "Barcelona, Spain", coordinate: .init(latitude: 48.8566, longitude: 6.4256)),
        User(fullName: "Brandon Septimus", occupation: "CTO", location: "Barcelona, Spain", coordinate: .init(latitude: 50.8566, longitude: 7.4256))
    ]

    private let newMembers: [User] = [
        User(fullName: "Brandon Septimus", occupation: "CTO", location: "Barcelona, Spain", coordinate: .init(latitude: 49.8566, longitude: 2.8522)),
        User(fullName: "Brandon Septimus", occupation: "CTO", location: "Barcelona, Spain", coordinate: .init(latitude: 41.7640, longitude: 4.2357)),
        User(fullName: "Brandon Septimus", occupation: "CTO", location: "Barcelona, Spain", coordinate: .init(latitude: 43.8566, longitude: 5.3256)),
        User(fullName: "Brandon Septimus", occupation: "CTO", location: "Barcelona, Spain", coordinate: .init(latitude: 54.8566, longitude: 6.4256))
    ]
    
    private var allUsers: [User] {
        var users = todaysPicks
        users.append(contentsOf: newMembers)
        return users
    }

    
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 4.5000),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack(alignment: .top) {
                    ZStack(alignment: .bottom) {
                        mapView
                        floatingView(geometry)
                        
                    }
                    Rectangle()
                        .fill(Color.sohoWhite)
                        .frame(height: geometry.safeAreaInsets.top + 76)
                        .opacity(isFullScreen ? 1 : 0)
                        .ignoresSafeArea()
                }
                .ignoresSafeArea()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        filterNavButton
                    }
                    ToolbarItem(placement: .principal) {
                        navTitle
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        searchNavButton
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                    Text("Connect")
                }
            }
        }
    }
    
    
    private var mapView: some View {
        Map(coordinateRegion: $region, annotationItems: allUsers) { user in
//            MapMarker(coordinate: city.coordinate, tint: .red)
            MapAnnotation(
                coordinate: user.coordinate,
                anchorPoint: CGPoint(x: 0.5, y: 0.5)
            ) {
                ZStack {
                    Circle()
                        .stroke(Color.white)
                        .frame(width: 44, height: 44)
                    
                    AsyncImage(url: URL(string: user.imageUrl))
                        .frame(width: 44, height: 44)
                        .clipped()
                        .clipShape(Circle())
                }
            }
        }
    }
    
    private func floatingView(_ geometry: GeometryProxy) -> some View {
        
        VStack {
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: isFullScreen ? 0 : 20)
                    .fill(Color.white)
                
                HStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.5))
                        .frame(width: 40, height: 4)
                    Spacer()
                }
                .padding(.top, 8)
                                
                ScrollView {
                    LazyVStack(spacing: 25) {
                        DiscoverUsersView(title: "Today's Picks", users: todaysPicks)
                        DiscoverUsersView(title: "New members", users: newMembers)
                    }
                }
                .padding()
                .frame(width: geometry.size.width)
            }
            .frame(height: isFullScreen ? (geometry.size.height - geometry.safeAreaInsets.top) : geometry.size.height * 0.55)
            .onTapGesture {
                withAnimation(.default) {
                    isFullScreen.toggle()
                }
            }
        }
    }
    
    private var filterNavButton: some View {
        ZStack(alignment: .center) {
            Circle()
                .fill(.white)
                .frame(width: 35, height: 35)
            
            
                Image(systemName: "line.3.horizontal.decrease")
                .resizable()
                .scaledToFit()
                .frame(width:15, height: 15)
                .foregroundColor(.black)
        }
    }
    
    private var navTitle: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
            Text("Connect")
                .font(.footnote)
        }
        .frame(width: 100, height: 35)
    }
    
    private var searchNavButton: some View {
        ZStack(alignment: .center) {
            Circle()
                .fill(.white)
                .frame(width: 35, height: 35)
            
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width:15, height: 15)
            .foregroundColor(.black)
        }
    }
    
    private var floatingPanelBodyView: some View {
        Text("Grid")
    }
}

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView()
    }
}
