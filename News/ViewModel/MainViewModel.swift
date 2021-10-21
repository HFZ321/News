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
    func getTitle(index:Int) -> String{
        return results[index].title ?? ""
    }
    func getUrl(index:Int) -> String{
        return results[index].url ?? ""
    }
    func getAuthor(index:Int) -> String{
        return results[index].byline ?? ""
    }
    func getDate(index:Int) -> String{
        return results[index].published_date ?? ""
    }
    func getMediaInfo(index:Int) -> String{
        return results[index].multimedia?[0].url ?? ""
    }
}
