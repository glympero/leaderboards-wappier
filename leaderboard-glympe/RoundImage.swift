//
//  RoundImage.swift
//  leaderboard-glympe
//
//  Created by George Lymperopoulos on 27/11/2016.
//  Copyright © 2016 George Lymperopoulos. All rights reserved.
//

import UIKit

class RoundImage: UIImageView {

    override func awakeFromNib() {
        layer.borderWidth = 4
        layer.masksToBounds = false
        layer.borderColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 1).cgColor
        layer.cornerRadius = layer.frame.height/2
        clipsToBounds = true
    }

}
