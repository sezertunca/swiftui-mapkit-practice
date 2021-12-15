import SwiftUI
import MapKit

struct MapView: View {
    
    let users: [User]
    
    @State private var region = MKCoordinateRegion (
        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 4.5000),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )
    
    var body: some View {
        
        Map(coordinateRegion: $region, annotationItems: users) { user in
            MapAnnotation(
                coordinate: user.coordinate,
                anchorPoint: CGPoint(x: 0.5, y: 0.5)
            ) {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 5)
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
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        
        let mockUsers: [User] = [
            User(fullName: "Brandon Septimus", occupation: "CTO", location: "Barcelona, Spain", coordinate: .init(latitude: 48.8566, longitude: 2.3522)),
            User(fullName: "Brandon Septimus", occupation: "CTO", location: "Barcelona, Spain", coordinate: .init(latitude: 45.7640, longitude: 4.8357)),
            User(fullName: "Brandon Septimus", occupation: "CTO", location: "Barcelona, Spain", coordinate: .init(latitude: 48.8566, longitude: 6.4256)),
            User(fullName: "Brandon Septimus", occupation: "CTO", location: "Barcelona, Spain", coordinate: .init(latitude: 50.8566, longitude: 7.4256))
        ]
        
        MapView(users: mockUsers)
    }
}
