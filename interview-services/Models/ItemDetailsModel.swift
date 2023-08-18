//
//  ItemDetailsResponseModel.swift
//  interview-services
//
//  Created by Lenard Pop on 12/08/2023.
//

import Foundation

public struct ItemDetailsModel: Decodable {
    public let id: Int
    public let title: String
    public let subtitle: String
    public let body: String
    public let date: String

    public init(id: Int, title: String, subtitle: String, body: String, date: String) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.body = body
        self.date = date
    }
}
