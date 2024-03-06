//
//  MovieDetailViewModelTests.swift
//  DevRevAssignmentTests
//
//  Created by ST IOS Dev10 on 06/03/24.
//

import XCTest
@testable import DevRevAssignment
import CustomNetworkPackage

class MovieDetailViewModelTests: XCTestCase {
    
    var viewModel: MovieDetailViewModel!
    var mockSession: MockURLSession!

    override func setUp() {
        super.setUp()
        viewModel = MovieDetailViewModel()
    }

    override func tearDown() {
        viewModel = nil
        mockSession = nil
        super.tearDown()
    }
    
    func testFetchMovieDetailsSuccess() {
        let jsonString = "{\"title\": \"Test Movie\", \"id\": 123}"
        let data = jsonString.data(using: .utf8)

        mockSession = MockURLSession(data: data, urlResponse: nil, error: nil)

        let expectation = self.expectation(description: "Fetching movie details")

        viewModel.fetchMovieDetails(movieId: 123) { success, error in
            XCTAssertTrue(success)
            XCTAssertNil(error)
            XCTAssertEqual(self.viewModel.movieDetail?.title, "The Lord of the Rings")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}

