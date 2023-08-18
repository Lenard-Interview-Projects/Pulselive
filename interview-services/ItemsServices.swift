//
//  ItemsServices.swift
//  interview-services
//
//  Created by Lenard Pop on 12/08/2023.
//

import Foundation
import Combine

public final class ItemsServices: ItemsServicesProtocol {

    private var cancellables: Set<AnyCancellable> = []
    private var networking = Networking()

    public init() { }

    public func getItemsList() -> AnyPublisher<ItemsResponseModel, Error> {
        return networking
            .fetchData(url: "https://pyatespulse.github.io/contentList.json")
    }

    public func getItemDetails(id: Int) -> AnyPublisher<ItemDetailsResponseModel, Error> {
        guard id > 0 else { return Fail(error: URLError(.zeroByteResource)).eraseToAnyPublisher() }

        return networking
            .fetchData(url: "https://pyatespulse.github.io/\(id).json")
    }
}
