//
//  ItemsResponseModel.swift
//  interview-services
//
//  Created by Lenard Pop on 12/08/2023.
//

import Foundation

public struct ItemsResponseModel: Decodable {
    public let items: [ItemModel]

    public init(items: [ItemModel]) {
        self.items = items
    }
}
