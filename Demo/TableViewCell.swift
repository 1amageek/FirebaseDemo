//
//  TableViewCell.swift
//  Demo
//
//  Created by 1amageek on 2018/07/02.
//  Copyright © 2018年 Stamp Inc. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.thumbnailImageView.clipsToBounds = true
        self.thumbnailImageView.layer.cornerRadius = 16
    }

    var post: Post?

    func set(post: Post) {
        self.post = post
        self.userNameLabel.text = post.user.object?.name
        _ = post.image?.getData(completion: { (data, error) in
            if let error = error {
                print(error)
                return
            }
            let image: UIImage = UIImage(data: data!)!
            self.contentImageView.image = image
            self.contentImageView.setNeedsDisplay()
        })
    }
}
