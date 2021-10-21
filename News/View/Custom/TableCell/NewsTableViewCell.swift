//
//  NewsTableViewCell.swift
//  News
//
//  Created by Hongfei Zheng on 10/15/21.
//

import UIKit
import SDWebImage
class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupLabel(title:String, date:String, author:String, url:String){
        titleLabel.text = title
        authorLabel.text = author
        titleLabel.numberOfLines = 0
        dateLabel.numberOfLines = 0
        authorLabel.numberOfLines = 0
        dateLabel.dateFormat(date: date)
        cellImageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage())

    }
    
}
