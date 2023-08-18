//
//  ItemsServicesTests.swift
//  interview-taskTests
//
//  Created by Lenard Pop on 15/08/2023.
//

import Foundation
import Combine
import interview_services

class ItemsServicesTests: ItemsServicesProtocol {

    var itemsResponseModel: ItemsResponseModel!
    var itemDetailsResponseModel: ItemDetailsResponseModel!

    public func withResult(itemsResponseModel: ItemsResponseModel) {
        self.itemsResponseModel = itemsResponseModel
    }

    public func withResult(itemDetailsResponseModel: ItemDetailsResponseModel) {
        self.itemDetailsResponseModel = itemDetailsResponseModel
    }

    func getItemsList() -> AnyPublisher<interview_services.ItemsResponseModel, Error> {
        let optionalPublisher: Just<ItemsResponseModel?> = Just(itemsResponseModel)

        return optionalPublisher
            .replaceNil(with: ItemsResponseModel(items: []))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func getItemDetails(id: Int) -> AnyPublisher<interview_services.ItemDetailsResponseModel, Error> {
        let optionalPublisher: Just<ItemDetailsResponseModel?> = Just(itemDetailsResponseModel)

        return optionalPublisher
            .replaceNil(with: ItemDetailsResponseModel(item: ItemDetailsModel(id: 0, title: "", subtitle: "", body: "", date: "")))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
