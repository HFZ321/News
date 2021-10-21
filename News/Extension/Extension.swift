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
extension UILabel{
    func dateFormat(date:String){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let dateTranslate = DateFormatter()
        dateTranslate.dateFormat = "MMM dd,yyyy"
        if let Date = dateFormatter.date(from: date) {
            self.text = dateTranslate.string(from: Date)
        }
    }
}

