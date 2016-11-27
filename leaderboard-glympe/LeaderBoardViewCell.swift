//
//  LeaderBoardViewCell.swift
//  leaderboard-glympe
//
//  Created by George Lymperopoulos on 27/11/2016.
//  Copyright © 2016 George Lymperopoulos. All rights reserved.
//

import UIKit

class LeaderBoardViewCell: UITableViewCell {
    
    var leaderBoard: LeaderBoard!

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(_ leaderboard: LeaderBoard){
        avatar.image = nil
        self.leaderBoard = leaderboard
        rank.text = "\(self.leaderBoard.rank)"
        name.text = leaderBoard.name
        points.text = "\(self.leaderBoard.points)"
        loadImageFromUrl(url: leaderBoard.avatar, view: avatar)
    }
}
