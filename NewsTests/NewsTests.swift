//
//  NewsTests.swift
//  NewsTests
//
//  Created by Hongfei Zheng on 10/15/21.
//

import XCTest
@testable import News

class NewsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApi(){
        let expectation = self.expectation(description: "must greater than 0")
        var result: NYTime?
        ApiHandler.shared.getData(urlString: Constant.newsUrl) { response in
            result = response
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10) { error in
            XCTAssertGreaterThan(result?.results?.count ?? 0, 0)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
