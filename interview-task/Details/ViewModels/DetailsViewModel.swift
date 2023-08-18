//
//  DetailsViewModel.swift
//  interview-task
//
//  Created by Lenard Pop on 12/08/2023.
//

import Foundation
import Combine
import Resolver
import interview_services

class DetailsViewModel: BaseViewModel {
    @Published var item: ItemDetailsViewModel = ItemDetailsViewModel()

    @Published var isLoading = true
    @Published var isInitialized = false

    @Injected var itemsServices: ItemsServicesProtocol

    init(id: Int) {
        super.init()

        self.item.id = id
        
        self.fetchData()
    }

    convenience init(id: Int, itemsServices: ItemsServicesProtocol) {
        self.init(id: id)
        self.itemsServices = itemsServices

        self.fetchData()
    }

    func fetchData() {
        isLoading = true;

        itemsServices
            .getItemDetails(id: self.item.id)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    // Log the error into something like Firebase/Sentry
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] (data: ItemDetailsResponseModel) in
                self?.item = ItemDetailsViewModel(item: data.item)
                self?.isLoading = false
                self?.isInitialized = true
            })
            .store(in: &cancellables)
    }
}
