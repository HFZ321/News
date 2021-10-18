//
//  NewsModel.swift
//  News
//
//  Created by Hongfei Zheng on 10/15/21.
//

import Foundation
struct NYTime:Codable{
    let results:[News]?
}
struct News:Codable{
    let title: String?
    let url: String?
    let byline: String?
    let published_date: String?
    let multimedia:[MediaInfo]?
}
struct MediaInfo:Codable{
    let url:String?
}
