
import Foundation
import MapKit

struct User: Identifiable {
    let id = UUID()
    let fullName: String
    let occupation: String
    let location: String
    let coordinate: CLLocationCoordinate2D
    let imageUrl = "https://picsum.photos/200"
}
