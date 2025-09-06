//
//  paws_app_iosApp.swift
//  paws_app_ios
//
//  Created by Vedant Sagolale on 06/09/25.
//

import SwiftUI

@main
struct paws_app_iosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Pet.self)
        }
    }
}
