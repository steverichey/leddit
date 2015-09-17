//
//  StoryItemCell.swift
//  leddit
//
//  Created by dev on 8/17/15.
//  Copyright © 2015 STVR. All rights reserved.
//

import UIKit

class StoryItemCell: UITableViewCell {
    @IBOutlet var cellLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
