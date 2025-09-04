//
//  whistlistApp.swift
//  whistlist
//
//  Created by Vedant Sagolale on 04/09/25.
//

import SwiftUI
import SwiftData

@main
struct whistlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for:Wish.self)
        }
    }
}
