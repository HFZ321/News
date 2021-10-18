//
//  CustomSearchBar.swift
//  News
//
//  Created by Hongfei Zheng on 10/15/21.
//

import UIKit
class CustomSearchBar: UIView, UISearchBarDelegate{
    let searchBar = UISearchBar()
    var delegate: SearchActive?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSearch()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSearch()
    }
    func setupSearch(){
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        addSubview(searchBar)
        let dictionary = ["searchBar":searchBar]
        let H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[searchBar]-0-|", options: [], metrics: nil, views: dictionary)
        let V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[searchBar]-0-|", options: [], metrics: nil, views: dictionary)
        addConstraints(H)
        addConstraints(V)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count != 0{
            delegate?.startSearching(currText: searchText)
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        delegate?.endSearching()
        searchBar.resignFirstResponder()
    }
}
protocol SearchActive{
    func startSearching(currText:String)
    func endSearching()
}
