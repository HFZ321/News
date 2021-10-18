//
//  Extension.swift
//  News
//
//  Created by Hongfei Zheng on 10/15/21.
//


import UIKit
extension UIImageView{
    func getImage(urlString: String){
        if let url = URL(string: urlString){
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async {
                        if let image = UIImage(data: data){
                        self.image = image
                        }
                    }
                    }
                }
                
            }
        }
    }

