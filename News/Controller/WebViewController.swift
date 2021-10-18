//
//  WebViewController.swift
//  News
//
//  Created by Hongfei Zheng on 10/15/21.
//

import UIKit
import WebKit
class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var webAddress:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let myURL = URL(string:webAddress ?? ""){
            let myRequest = URLRequest(url: myURL)
            webView.load(myRequest)
        }
     
//        if let url = URL(string: webAddress ?? "") {
//            UIApplication.shared.open(url)
//        }
        
    }
    
}
