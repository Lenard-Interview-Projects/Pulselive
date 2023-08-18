//
//  DetailsViewModelTests.swift
//  interview-taskTests
//
//  Created by Lenard Pop on 14/08/2023.
//

import Foundation
import XCTest
import interview_services
@testable import interview_task

class DetailsViewModelTests: XCTestCase {

    let services: ItemsServicesTests = ItemsServicesTests()
    var viewModel: DetailsViewModel!

    func test_fetchData() throws {
        // Arrange
        let mockData = ItemDetailsResponseModel(item: ItemDetailsModel(id: 1, title: "Article 1", subtitle: "1", body: "1", date: "1/1/2023"))

        viewModel = DetailsViewModel(id: 0, itemsServices: services)
        services.withResult(itemDetailsResponseModel: mockData)

        // Act
        viewModel.fetchData()

        // Assert
        XCTAssertEqual(1, viewModel.item.id)
        XCTAssertEqual("Article 1", viewModel.item.title)
        XCTAssertEqual("1", viewModel.item.subtitle)
        XCTAssertEqual("1", viewModel.item.body)
        XCTAssertTrue(viewModel.isInitialized)
        XCTAssertFalse(viewModel.isLoading)
    }
}
