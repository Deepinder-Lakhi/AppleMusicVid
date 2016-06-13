//
//  CustomMusicCell.swift
//  AppleMusicVid
//
//  Created by DEEPINDERPAL SINGH on 31/05/16.
//  Copyright © 2016 Dimonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class CustomMusicCell: UITableViewCell {

    var videos:Videos? {
        didSet {
            updateCell()
        }
    }
    
    @IBOutlet weak var musicImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var discriptionLbl: UILabel!
    
    func updateCell() {
        titleLbl.text = videos?.vName
        musicImgView.image = UIImage(named: "maxresdefault")
        
    }
    
}
