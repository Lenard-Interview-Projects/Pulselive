//
//  ItemModel.swift
//  interview-services
//
//  Created by Lenard Pop on 12/08/2023.
//

import Foundation

public struct ItemModel: Decodable {
    public let id: Int
    public let title: String
    public let subtitle: String
    public let date: String

    public init(id: Int, title: String, subtitle: String, date: String) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.date = date
    }
}
