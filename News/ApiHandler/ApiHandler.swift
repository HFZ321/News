//
//  ApiHandler.swift
//  News
//
//  Created by Hongfei Zheng on 10/15/21.
//

import Foundation
class ApiHandler{
    static let shared = ApiHandler()
    typealias Completion = ((NYTime?) -> ())?
    func getData(urlString:String,completionHandler:Completion){
        if let url = URL(string: urlString){
            URLSession.shared.dataTask(with: url) { Data, Response, Error in
                if let data = Data{
                        let decodeJson = try? JSONDecoder.init().decode(NYTime.self, from: data)
                        completionHandler?(decodeJson)
                }
            }.resume()
        }
    }
}
