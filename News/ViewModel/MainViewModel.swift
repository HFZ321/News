//
//  MainViewModel.swift
//  News
//
//  Created by Hongfei Zheng on 10/15/21.
//

import Foundation
class MainViewModel{
    var results:[News] = []
    typealias Completion = (() ->())?
    func getNews(completionHandler: Completion){
        ApiHandler.shared.getData(urlString: Constant.newsUrl) { response in
            if let decodeData = response?.results{
                self.results = decodeData
                completionHandler?()
            }
        }
    }
}
