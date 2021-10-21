//
//  NewsTests.swift
//  NewsTests
//
//  Created by Hongfei Zheng on 10/15/21.
//

import XCTest
@testable import News

class NewsTests: XCTestCase {
    var viewModel:MainViewModel?
    override func setUp(){
        viewModel = MainViewModel()
    }

    override func tearDown(){
        viewModel = nil
    }

    func testApi(){
        let expectation = self.expectation(description: "must greater than 0")
        var result: NYTime?
        ApiHandler.shared.getData(urlString: Constant.newsUrl) { response in
            result = response
            expectation.fulfill()
        }
        waitForExpectations(timeout: 100) { error in
            XCTAssertGreaterThan(result?.results?.count ?? 0, 0)
        }
    }
    func testViewModel(){
        let expectation = self.expectation(description: "must greater than 0")
        viewModel?.getNews {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 100) { error in
            XCTAssertGreaterThan(self.viewModel?.results.count ?? 0, 0)
        }
    }
    func testGetTitle(){
        let news = News(title: "NewYorkTime", url: "www.google.com", byline: "unknown", published_date: "1/1/2021", multimedia: [MediaInfo(url: "www.picture.com")])
        viewModel?.results.append(news)
        viewModel?.results.append(News(title: nil, url: nil, byline: nil, published_date: nil, multimedia: nil))
        XCTAssertEqual(viewModel?.getTitle(index: 0), "NewYorkTime")
        XCTAssertEqual(viewModel?.getTitle(index: 1), "")
        
        
    }
    func testGetUrl(){
        let news = News(title: "NewYorkTime", url: "www.google.com", byline: "unknown", published_date: "1/1/2021", multimedia: [MediaInfo(url: "www.picture.com")])
        viewModel?.results.append(news)
        viewModel?.results.append(News(title: nil, url: nil, byline: nil, published_date: nil, multimedia: nil))
        XCTAssertEqual(viewModel?.getUrl(index: 0), "www.google.com")
        XCTAssertEqual(viewModel?.getUrl(index: 1), "")
    }
    func testGetAuthor(){
        let news = News(title: "NewYorkTime", url: "www.google.com", byline: "unknown", published_date: "1/1/2021", multimedia: [MediaInfo(url: "www.picture.com")])
        viewModel?.results.append(news)
        viewModel?.results.append(News(title: nil, url: nil, byline: nil, published_date: nil, multimedia: nil))
        XCTAssertEqual(viewModel?.getAuthor(index: 0), "unknown")
        XCTAssertEqual(viewModel?.getAuthor(index: 1), "")
    }
    func testGetDate(){
        let news = News(title: "NewYorkTime", url: "www.google.com", byline: "unknown", published_date: "1/1/2021", multimedia: [MediaInfo(url: "www.picture.com")])
        viewModel?.results.append(news)
        viewModel?.results.append(News(title: nil, url: nil, byline: nil, published_date: nil, multimedia: nil))
        XCTAssertEqual(viewModel?.getDate(index: 0), "1/1/2021")
        XCTAssertEqual(viewModel?.getDate(index: 1), "")
    }
    func testGetMediaInfo(){
        let news = News(title: "NewYorkTime", url: "www.google.com", byline: "unknown", published_date: "1/1/2021", multimedia: [MediaInfo(url: "www.picture.com")])
        viewModel?.results.append(news)
        viewModel?.results.append(News(title: nil, url: nil, byline: nil, published_date: nil, multimedia: nil))
        XCTAssertEqual(viewModel?.getMediaInfo(index: 0), "www.picture.com")
        XCTAssertEqual(viewModel?.getMediaInfo(index: 1), "")
    }

}
