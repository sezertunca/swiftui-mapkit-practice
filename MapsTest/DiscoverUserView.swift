import SwiftUI

struct DiscoverUserView: View {
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {

            AsyncImage(
                url: URL(string: user.imageUrl),
                content: { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(maxWidth: 150, maxHeight: 150)
                },
                placeholder: {
                    ProgressView()
                }
            )
            Group {
                Text(user.fullName)
                    .font(.footnote)
                    .fontWeight(.light)
                Text(user.occupation)
                    
            }
            
            Text(user.location)
                .fontWeight(.light)
                .font(.footnote)
                .padding(.top, 10)
                
        }
    }
}

struct DiscoverUserView_Previews: PreviewProvider {
    static var previews: some View {
        
        DiscoverUserView(user: User(fullName: "Brandon Septimus",
                                    occupation: "CTO",
                                    location: "Barcelona, Spain",
                                    coordinate: .init(latitude: 48.8566, longitude: 2.3522)))
    }
}
