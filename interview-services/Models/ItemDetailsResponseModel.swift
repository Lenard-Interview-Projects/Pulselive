//
//  ItemDetailsResponseModel.swift
//  interview-services
//
//  Created by Lenard Pop on 12/08/2023.
//

import Foundation

public struct ItemDetailsResponseModel: Decodable {
    public let item: ItemDetailsModel

    public init(item: ItemDetailsModel) {
        self.item = item
    }
}
