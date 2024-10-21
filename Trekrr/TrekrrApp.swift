//
//  TrekrrApp.swift
//  Trekrr
//
//  Created by Martin on 2024. 10. 19..
//

import SwiftUI
import SwiftData

@main
struct TrekrrApp: App {
    @StateObject var locations = Locations()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ContentView(location: locations.primary)
                }
                .tabItem {
                    Image(systemName: "figure.hiking")
                    Text("Discover")
                }
                NavigationView {
                    WorldView()
                }
                .tabItem {
                    Image(systemName: "globe.europe.africa")
                    Text("Locations")
                }
                NavigationView {
                    TipsView()
                }
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Tips")
                }
            }.environmentObject(locations)
        }
        .modelContainer(sharedModelContainer)
    }
}
