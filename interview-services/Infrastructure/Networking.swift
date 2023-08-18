//
//  Networking.swift
//  interview-services
//
//  Created by Lenard Pop on 12/08/2023.
//

import Foundation
import Combine

public struct Networking {

    public init() { }

    public func fetchData<T: Decodable>(url: String) -> AnyPublisher<T, Error> {
        guard let url = URL(string: url) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
