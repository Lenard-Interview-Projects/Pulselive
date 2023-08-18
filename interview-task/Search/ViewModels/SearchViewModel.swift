//
//  SearchViewModel.swift
//  interview-task
//
//  Created by Lenard Pop on 13/08/2023.
//

import Foundation
import Combine
import Resolver
import interview_services

class SearchViewModel: BaseViewModel {
    @Published var articles: [ItemViewModel] = []
    @Published var searchQuery: String = ""

    @Published var isLoading = true
    @Published var isInitialized = false
    @Published var isEmpty = false

    @Injected var itemsServices: ItemsServicesProtocol

    init(query: String) {
        super.init()

        self.searchQuery = query
        self.searchQueryValidation()
    }

    convenience init(query: String, itemsServices: ItemsServicesProtocol) {
        self.init(query: query)
        self.itemsServices = itemsServices

        self.searchQueryValidation()
    }

    func searchQueryValidation() {
        self.$searchQuery
            .debounce(for: isInitialized ? 0.5 : 0.0, scheduler: DispatchQueue.main)
            .map { searchQuery in
                return searchQuery
            }
            .sink { searchQuery in
                if !searchQuery.isEmpty {
                    self.isLoading = true
                    self.filterArticles()
                } else {
                    self.isLoading = false
                    self.isEmpty = true
                    self.isInitialized = true
                }
            }
            .store(in: &cancellables)
    }

    private func filterArticles() {
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
                let filteredData = data.items
                    .filter { item in item.title.lowercased().contains(self?.searchQuery.lowercased() ?? "") }
                    .map({ ItemViewModel(item: $0) })
                
                self?.articles = filteredData
                self?.isLoading = false
                self?.isInitialized = true
                self?.isEmpty = filteredData.isEmpty
            })
            .store(in: &self.cancellables)
    }
}
