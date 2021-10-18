//
//  CustomNewsTable.swift
//  News
//
//  Created by Hongfei Zheng on 10/15/21.
//

import Foundation
import UIKit
class CustomNewsTable: UIView, UITableViewDelegate, UITableViewDataSource{
    let tableView = UITableView()
    var model = MainViewModel()
    var filterModel = MainViewModel()
    var isSearch = false
    var delegate: PassData?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch{
            return filterModel.results.count
        }
        return model.results.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NewsTableViewCell
        var new = model.results[indexPath.row]
        if isSearch{
            new = filterModel.results[indexPath.row]
        }
        cell?.setupLabel(title: new.title ?? "", date: new.published_date ?? "", author: new.byline ?? "", url: new.multimedia?[0].url ?? "")
        return cell ?? NewsTableViewCell()
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearch{
            delegate?.passData(urlString: filterModel.results[indexPath.row].url ?? "")
        }else{
            delegate?.passData(urlString: model.results[indexPath.row].url ?? "")
        }
        
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Latest News"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTable()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTable()
    }
    func setupTable(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        addSubview(tableView)
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        let dictionary = ["tableView":tableView]
        let H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: [], metrics: nil, views: dictionary)
        let V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|", options: [], metrics: nil, views: dictionary)
        addConstraints(H)
        addConstraints(V)
        
    }
    func reload(){
        tableView.reloadData()
    }
    func filter(searchText:String){
        let results = model.results
        filterModel.results = results.filter({ (result: News) -> Bool in
            return (result.title ?? "").lowercased().contains(searchText.lowercased())
        })
        isSearch = true
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    func loadOriginTable(){
        isSearch = false
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

protocol PassData{
    func passData(urlString:String)
}
