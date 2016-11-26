//
//  LeaderBoardCell.swift
//  leaderboard-glympe
//
//  Created by George Lymperopoulos on 26/11/2016.
//  Copyright © 2016 George Lymperopoulos. All rights reserved.
//

import UIKit

class LeaderBoardCell: UICollectionViewCell {
    var leaderBoard: LeaderBoard!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ leaderboard: LeaderBoard){
        self.leaderBoard = leaderboard    }
    
    func getName() -> String{
        return leaderBoard.name
    }
    
    func getId() -> Int{
        return leaderBoard.rank
    }
    
    func getAvatar() -> String{
        return leaderBoard.avatar
    }
    
    func getPoints() -> Int {
        return leaderBoard.points
    }

}
