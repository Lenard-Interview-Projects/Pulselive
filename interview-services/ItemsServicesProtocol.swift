//
//  ItemsServicesProtocol.swift
//  interview-services
//
//  Created by Lenard Pop on 12/08/2023.
//

import Foundation
import Combine

public protocol ItemsServicesProtocol { 
    func getItemsList() -> AnyPublisher<ItemsResponseModel, Error>
    func getItemDetails(id: Int) -> AnyPublisher<ItemDetailsResponseModel, Error>
}
