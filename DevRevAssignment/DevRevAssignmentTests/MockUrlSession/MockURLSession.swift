//
//  MockURLSession.swift
//  DevRevAssignmentTests
//
//  Created by ST IOS Dev10 on 06/03/24.
//

import Foundation
class MockURLSession: URLSession {
    var cachedUrl: URL?
    private let mockTask: MockURLSessionDataTask

    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        mockTask = MockURLSessionDataTask(data: data, urlResponse: urlResponse, error: error)
    }

    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.cachedUrl = url
        mockTask.completionHandler = completionHandler
        return mockTask
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    private let data: Data?
    private let urlResponse: URLResponse?
    private let respError: Error?

    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?

    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.data = data
        self.urlResponse = urlResponse
        self.respError = error
    }

    override func resume() {
        completionHandler?(data, urlResponse, respError)
    }
}
