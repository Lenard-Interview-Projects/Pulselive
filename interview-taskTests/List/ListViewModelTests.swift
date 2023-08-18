//
//  ListViewModelTests.swift
//  interview-taskTests
//
//  Created by Lenard Pop on 14/08/2023.
//

import Foundation
import XCTest
import interview_services
@testable import interview_task

class ListViewModelTests: XCTestCase {

    let services: ItemsServicesTests = ItemsServicesTests()
    var viewModel: ListViewModel!

    func test_fetchData() throws {
        // Arrange
        let mockData = [
            ItemModel(id: 1, title: "1", subtitle: "1", date: "1/1/2023"),
            ItemModel(id: 2, title: "2", subtitle: "2", date: "2/1/2023"),
            ItemModel(id: 3, title: "3", subtitle: "3", date: "3/1/2023"),
            ItemModel(id: 4, title: "4", subtitle: "4", date: "4/1/2023"),
            ItemModel(id: 5, title: "5", subtitle: "5", date: "5/1/2023")
        ]

        viewModel = ListViewModel(itemsServices: services)
        services.withResult(itemsResponseModel: ItemsResponseModel.init(items: mockData))

        // Act
        viewModel.fetchData()

        // Assert
        XCTAssertEqual(5, viewModel.articles.count)
        XCTAssertTrue(viewModel.isReady)
        XCTAssertTrue(viewModel.isInitialized)
        XCTAssertFalse(viewModel.isLoading)
    }
}
