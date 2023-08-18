//
//  SearchViewModelTests.swift
//  interview-taskTests
//
//  Created by Lenard Pop on 14/08/2023.
//

import Foundation
import XCTest
import interview_services
@testable import interview_task

class SearchViewModelTests: XCTestCase {

    let services: ItemsServicesTests = ItemsServicesTests()
    var viewModel: SearchViewModel!

    func test_fetchData() throws {
        // Arrange
        let expectation = XCTestExpectation(description: "Debounce Delay")

        let mockData = [
            ItemModel(id: 1, title: "Article 1", subtitle: "1", date: "1/1/2023"),
            ItemModel(id: 2, title: "Article 2", subtitle: "2", date: "2/1/2023"),
            ItemModel(id: 3, title: "Article 3", subtitle: "3", date: "3/1/2023"),
            ItemModel(id: 4, title: "Article 4", subtitle: "4", date: "4/1/2023"),
            ItemModel(id: 5, title: "Article 5", subtitle: "5", date: "5/1/2023")
        ]

        services.withResult(itemsResponseModel: ItemsResponseModel.init(items: mockData))
        viewModel = SearchViewModel(query: "Article", itemsServices: services)

        // Act
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill() // Fulfill the expectation
        }

        // Assert
        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(5, viewModel.articles.count)
        XCTAssertTrue(viewModel.isInitialized)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertFalse(viewModel.isEmpty)
    }

    func test_fetchData_singleResult() throws {
        // Arrange
        let expectation = XCTestExpectation(description: "Debounce Delay")

        let mockData = [
            ItemModel(id: 1, title: "Article 1", subtitle: "1", date: "1/1/2023"),
            ItemModel(id: 2, title: "Article 2", subtitle: "2", date: "2/1/2023"),
            ItemModel(id: 3, title: "Article 3", subtitle: "3", date: "3/1/2023"),
            ItemModel(id: 4, title: "Article 4", subtitle: "4", date: "4/1/2023"),
            ItemModel(id: 5, title: "Article 5", subtitle: "5", date: "5/1/2023")
        ]

        services.withResult(itemsResponseModel: ItemsResponseModel.init(items: mockData))
        viewModel = SearchViewModel(query: "Article 2", itemsServices: services)

        // Act
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill() // Fulfill the expectation
        }

        // Assert
        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(1, viewModel.articles.count)
        XCTAssertTrue(viewModel.isInitialized)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertFalse(viewModel.isEmpty)
    }

    func test_fetchData_noResult() throws {
        // Arrange
        let expectation = XCTestExpectation(description: "Debounce Delay")

        let mockData = [
            ItemModel(id: 1, title: "Article 1", subtitle: "1", date: "1/1/2023"),
            ItemModel(id: 2, title: "Article 2", subtitle: "2", date: "2/1/2023"),
            ItemModel(id: 3, title: "Article 3", subtitle: "3", date: "3/1/2023"),
            ItemModel(id: 4, title: "Article 4", subtitle: "4", date: "4/1/2023"),
            ItemModel(id: 5, title: "Article 5", subtitle: "5", date: "5/1/2023")
        ]

        services.withResult(itemsResponseModel: ItemsResponseModel.init(items: mockData))
        viewModel = SearchViewModel(query: "Article 6", itemsServices: services)

        // Act
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill() // Fulfill the expectation
        }

        // Assert
        wait(for: [expectation], timeout: 1)

        XCTAssertTrue(viewModel.articles.isEmpty)
        XCTAssertTrue(viewModel.isInitialized)
        XCTAssertTrue(viewModel.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
    }

    func test_fetchData_searchQueryNotProvided() throws {
        // Arrange
        let expectation = XCTestExpectation(description: "Debounce Delay")

        let mockData = [
            ItemModel(id: 1, title: "Article 1", subtitle: "1", date: "1/1/2023"),
            ItemModel(id: 2, title: "Article 2", subtitle: "2", date: "2/1/2023"),
            ItemModel(id: 3, title: "Article 3", subtitle: "3", date: "3/1/2023"),
            ItemModel(id: 4, title: "Article 4", subtitle: "4", date: "4/1/2023"),
            ItemModel(id: 5, title: "Article 5", subtitle: "5", date: "5/1/2023")
        ]

        services.withResult(itemsResponseModel: ItemsResponseModel.init(items: mockData))
        viewModel = SearchViewModel(query: "", itemsServices: services)

        // Act
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill() // Fulfill the expectation
        }

        // Assert
        wait(for: [expectation], timeout: 1)

        XCTAssertTrue(viewModel.articles.isEmpty)
        XCTAssertTrue(viewModel.isInitialized)
        XCTAssertTrue(viewModel.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
    }
}
