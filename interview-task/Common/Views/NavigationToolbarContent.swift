//
//  NavigationToolbarContent.swift
//  interview-task
//
//  Created by Lenard Pop on 13/08/2023.
//

import SwiftUI

@ToolbarContentBuilder
func NavigationToolbarContent(hideBurger: Bool = false) -> some ToolbarContent {
    ToolbarItem(placement: .navigationBarLeading) {
        if hideBurger == false {
            Image(systemName: "line.3.horizontal")
                .resizable()
                .frame(width: 25, height: 15)
        }
    }

    ToolbarItem(placement: .principal) {
        Image("NavigationIcon")
            .resizable()
            .frame(width: 40, height: 40)
    }

    ToolbarItem(placement: .navigationBarTrailing) {
        Image("Avatar")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 30, height: 30)
            .clipShape(Circle())
    }
}
