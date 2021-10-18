//
//  ViewController.swift
//  News
//
//  Created by Hongfei Zheng on 10/15/21.
//

import UIKit

class MainViewController: UIViewController{
    let model = MainViewModel()
    let searchBar = CustomSearchBar()
    let mainTableView = CustomNewsTable()
    let matrics = ["height": 44]
    override func viewDidLoad() {
        super.viewDidLoad()
        getTableData()
        setupSearchBar()
        setupTable()
    }
    func getTableData(){
        model.getNews {
            DispatchQueue.main.async {
                self.mainTableView.model = self.model
                self.mainTableView.reload()
            }
        }
    }
    
    func setupSearchBar(){
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
        view.addSubview(searchBar)
        let ditionary = ["mainTableView": mainTableView, "searchBar":searchBar]
        let searchH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[searchBar]-0-|", options: [], metrics: nil, views: ditionary)
        let searchV = NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[searchBar(height)]|", options: [], metrics: matrics, views: ditionary)
        view.addConstraints(searchH)
        view.addConstraints(searchV)
    }
    func setupTable(){
        mainTableView.delegate = self
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainTableView)
        let ditionary = ["mainTableView": mainTableView, "searchBar":searchBar]
        let tableH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[mainTableView]-0-|", options: [], metrics: nil, views: ditionary)
        let tableV = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[searchBar]-0-[mainTableView]-0-|", options: [], metrics: nil, views: ditionary)
        view.addConstraints(tableH)
        view.addConstraints(tableV)
    }
}
extension MainViewController: PassData{
    func passData(urlString: String) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
        if let vc = vc{
            vc.webAddress = urlString
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
extension MainViewController: SearchActive{
    func startSearching(currText: String) {
        mainTableView.filter(searchText: currText)
    }
    
    func endSearching() {
        mainTableView.loadOriginTable()
    }
    
    
}
