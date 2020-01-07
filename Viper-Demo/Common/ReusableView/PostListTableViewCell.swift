//
//  PostListTableViewCell.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import UIKit

class PostListTableViewCell: UITableViewCell {

    @IBOutlet weak var bodyLabel: UILabel!
    
    var post: Post? {
        didSet {
            bodyLabel.text = post?.body
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
