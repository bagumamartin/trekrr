//
//  TipsView.swift
//  Trekrr
//
//  Created by Martin on 2024. 10. 19..
//

import SwiftUI

struct TipsView: View {
    let tips: [Tip]
    
    init() {
        let url = Bundle.main.url(forResource: "tips", withExtension: "json")!
        
        let data = try! Data(contentsOf: url)
        
        tips = try! JSONDecoder().decode([Tip].self, from: data)
    }
    
    var body: some View {
        List(tips, id: \.text, children: \.children) {
            tip in
            if tip.children != nil {
                Label(tip.text, systemImage: "quote.bubble")
                    .font(Font.headline)
            } else {
                Text(tip.text)
            }
        }
        .navigationTitle("Tips")
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
        NavigationView {
            TipsView()
        }
        .tabItem {
            Image(systemName: "list.bullet")
            Text("Tips")
        }
    }
}
