//
//  BaseViewModel.swift
//  interview-task
//
//  Created by Lenard Pop on 14/08/2023.
//

import Foundation
import Combine

public class BaseViewModel: ObservableObject {
    internal var cancellables: Set<AnyCancellable> = []

    deinit {
        cancelAnyPublishers()
    }

    public func cancelAnyPublishers() {
        cancellables.forEach { $0.cancel() }
    }
}
