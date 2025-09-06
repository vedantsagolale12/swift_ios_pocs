//
//  Pet.swift
//  paws_app_ios
//
//  Created by Vedant Sagolale on 06/09/25.
//

import Foundation
import SwiftData

@Model
final class Pet {
    var name: String
    @Attribute(.externalStorage) var photo: Data? // external strorage i.e optional !

    init(name: String, photo: Data? = nil) {
        self.name = name
        self.photo = photo
    }
}

extension Pet{
    @MainActor
    static var preview: ModelContainer{
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for:Pet.self,configurations: configuration)
        
        container.mainContext.insert(Pet(name: "Yash"))
        container.mainContext.insert(Pet(name: "Tejas"))
        container.mainContext.insert(Pet(name: "Aditya"))
        container.mainContext.insert(Pet(name: "Rajeev"))
        container.mainContext.insert(Pet(name: "Piyush"))
        container.mainContext.insert(Pet(name: "Vedant"))
        container.mainContext.insert(Pet(name: "Sanket"))
        container.mainContext.insert(Pet(name: "Ayan"))
        
        return container
    }
}
