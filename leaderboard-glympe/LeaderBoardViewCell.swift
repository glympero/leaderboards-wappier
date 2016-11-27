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
        self.leaderBoard = leaderboard
        rank.text = "\(self.leaderBoard.rank)"
        name.text = leaderBoard.name
        points.text = "\(self.leaderBoard.points)"
        loadImageFromUrl(url: leaderBoard.avatar, view: avatar)
    }
    
//    func getName() -> String{
//        return leaderBoard.name
//    }
//    
//    func getId() -> Int{
//        return leaderBoard.rank
//    }
//    
//    func getAvatar() -> String{
//        return leaderBoard.avatar
//    }
//    
//    func getPoints() -> Int {
//        return leaderBoard.points
//    }
    
    func loadImageFromUrl(url: String, view: UIImageView){
        
        let url = NSURL(string: url)!
        
        let task = URLSession.shared.dataTask(with: url as URL) { (responseData, responseUrl, error) -> Void in
            if let data = responseData{
                DispatchQueue.main.async(execute: { () -> Void in
                    view.image = UIImage(data: data)
                })
            }
        }
        task.resume()
    }
}
