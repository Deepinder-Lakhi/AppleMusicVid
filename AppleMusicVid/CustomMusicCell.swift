//
//  CustomMusicCell.swift
//  AppleMusicVid
//
//  Created by DEEPINDERPAL SINGH on 31/05/16.
//  Copyright © 2016 Dimonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class CustomMusicCell: UITableViewCell {

    @IBOutlet weak var musicImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var discriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
