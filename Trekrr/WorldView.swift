//
//  WorldView.swift
//  Trekrr
//
//  Created by Martin on 2024. 10. 19..
//

import SwiftUI
import MapKit

struct WorldView: View {
    @EnvironmentObject var locations: Locations
    
    @State private var position: MapCameraPosition = .region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
        span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
    ))
    
    var body: some View {
        Map(position: $position) {
            ForEach(locations.places) { location in
                Annotation(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                    NavigationLink(destination: ContentView(location: location)) {
                        Image(location.country)
                            .resizable()
                            .cornerRadius(10)
                            .frame(width: 80, height: 40)
                            .shadow(radius: 3)
                    }
                }
            }
        }
        .navigationTitle("Locations")
    }
}

#Preview {
    @Previewable @StateObject var locations = Locations()
    
    TabView {
        NavigationView {
            ContentView(location: locations.primary)
        }
        .tabItem {
            Image(systemName: "mountain.2")
            Text("Discover")
        }
        NavigationView {
            WorldView()
        }
        .tabItem {
            Image(systemName: "globe.europe.africa")
            Text("Locations")
        }
    }.environmentObject(locations)
}
