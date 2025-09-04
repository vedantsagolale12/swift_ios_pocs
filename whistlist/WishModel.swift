//
//  WishModel.swift
//  whistlist
//
//  Created by Vedant Sagolale on 04/09/25.
//

import Foundation
import SwiftData

@Model
class Wish{
    var title:String
    init(title: String) {
        self.title = title
    }
}
