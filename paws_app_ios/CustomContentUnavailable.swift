//
//  CustomContentUnavailable.swift
//  paws_app_ios
//
//  Created by Vedant Sagolale on 06/09/25.
//

import SwiftUI

struct CustomContentUnavailable: View {
    var icon: String
    var title: String
    var description: String

    var body: some View {
        ContentUnavailableView{
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width:96)
            Text(title)
                .font(.title)
        } description: {
            Text(description)
        }
        .foregroundStyle(.tertiary)
    }
}

#Preview {
    CustomContentUnavailable(
        icon: "cat.circle",
        title: "No Photo",
        description: "Add Photo to get started"
    )
}
