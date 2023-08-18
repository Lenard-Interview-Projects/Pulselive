//
//  ListViewModel.swift
//  interview-task
//
//  Created by Lenard Pop on 12/08/2023.
//

import Foundation
import Combine
import Resolver
import interview_services

class ListViewModel: BaseViewModel {
    @Published var articles: [ItemViewModel] = []
    @Published var searchQuery: String = ""
    @Published var searchQueryValid: Bool = false

    @Published var isLoading = true
    @Published var isInitialized = false

    @Injected var itemsServices: ItemsServicesProtocol

    var isReady: Bool {
        return isInitialized == true && isLoading == false
    }

    convenience init(itemsServices: ItemsServicesProtocol) {
        self.init()

        self.itemsServices = itemsServices
    }

    func fetchData() {
        isLoading = true;

        itemsServices
            .getItemsList()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    // Log the error into something like Firebase/Sentry
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] (data: ItemsResponseModel) in
                self?.articles = data.items.map({ ItemViewModel(item: $0) })
                self?.isLoading = false
                self?.isInitialized = true
            })
            .store(in: &cancellables)
    }
}
