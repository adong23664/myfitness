//
//  GYMDetailIconTextCellTableViewCell.swift
//  myFitness
//
//  Created by 楊振東 on 2021/7/9.
//

import UIKit

class GymDetailIconTextCell: UITableViewCell {
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var shortTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
