//
//  ContentView.swift
//  Trekrr
//
//  Created by Martin on 2024. 10. 19..
//

import SwiftUI
import SwiftData

//struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
//
//    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
//}

struct ContentView: View {
    let location: Location
    
    var body: some View {
        ScrollView {
            Image(location.heroPicture)
                .resizable()
                .scaledToFit()
            
            Text(location.name)
                .font(Font.largeTitle)
                .bold()
                .padding(Edge.Set.horizontal)
                .multilineTextAlignment(TextAlignment.center)
                
            Text(location.country)
                .font(Font.title)
                .foregroundColor(Color.secondary)
                .padding(Edge.Set.horizontal)
                .multilineTextAlignment(TextAlignment.center)
            
            Text(location.description)
                .padding(Edge.Set.horizontal)
            Text("Did you know?")
                .font(Font.title3)
                .bold()
                .padding(Edge.Set.top)
            Text(location.more)
                .padding(Edge.Set.horizontal)
            
        }.navigationTitle("Discover")
    }
}

#Preview {
    NavigationView {
        ContentView(location: Locations().primary)
            .modelContainer(for: Item.self, inMemory: true)
    }
}
