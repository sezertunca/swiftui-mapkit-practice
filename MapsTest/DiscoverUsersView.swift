//
//  DiscoverUsersView.swift
//  MapsTest
//
//  Created by Sezer Tunca on 08/12/2021.
//

import SwiftUI

struct DiscoverUsersView: View {
    let title: String
    let users: [User]
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.title)
                .fontWeight(.light)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(users) { user in
                        DiscoverUserView(user: user)
                            .frame(height: 200)
                    }
                }
            }
        }
        .padding(.horizontal, 15)
        .frame(width: UIScreen.main.bounds.width, height: 240)
    }
}

struct DiscoverUsersView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverUsersView(title: "Today's Picks",
                          users: [
        User(fullName: "Brandon Septimus", occupation: "CTO", location: "Barcelona, Spain", coordinate: .init(latitude: 48.8566, longitude: 2.3522)),
        User(fullName: "Brandon Septimus", occupation: "CTO", location: "Barcelona, Spain", coordinate: .init(latitude: 48.8566, longitude: 2.3522)),
        User(fullName: "Brandon Septimus", occupation: "CTO", location: "Barcelona, Spain", coordinate: .init(latitude: 48.8566, longitude: 2.3522)),
        User(fullName: "Brandon Septimus", occupation: "CTO", location: "Barcelona, Spain", coordinate: .init(latitude: 48.8566, longitude: 2.3522))
        ])
    }
}
