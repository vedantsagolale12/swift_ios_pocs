//
//  ContentView.swift
//  Wishlist
//
//  Created by Vedant Sagolale on 04/09/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    @State private var isAlertShowing = false
    @State private var title = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .swipeActions {
                            Button(role: .destructive) {
                                modelContext.delete(wish)
                            } label: {
                                Text("Delete")
                            }
                        }
                }
            }
            .navigationTitle("Wishlist")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                
                if !wishes.isEmpty {
                    ToolbarItem(placement: .bottomBar) {
                        Text("\(wishes.count) wish\(wishes.count > 1 ? "es" : "")")
                            .font(.title2.bold().monospacedDigit())
                    }
                }
            }
            .alert("Create a new Wish", isPresented: $isAlertShowing) {
                TextField("Enter a wish", text: $title)
                
                Button("Save") {
                    modelContext.insert(Wish(title: title))
                    title = ""
                }
            }
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView(
                        "My Wishlist",
                        systemImage: "heart.circle",
                        description: Text("No Wishes yet. Add one to get started.")
                            .font(.headline)
                    )
                }
            }
        }
    }
}

// MARK: - Preview

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
