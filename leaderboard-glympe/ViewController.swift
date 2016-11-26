//
//  ViewController.swift
//  leaderboard-glympe
//
//  Created by George Lymperopoulos on 26/11/2016.
//  Copyright © 2016 George Lymperopoulos. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var currentLeaderBoard = 0
    var globalRank = 1
    var leaderBoard = [LeaderBoard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadAndReloadTable()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func refreshTable(_ sender: Any) {
        downloadAndReloadTable()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderBoard.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if(indexPath.row == (leaderBoard.count - 1)){
            currentLeaderBoard = currentLeaderBoard + 1
            downloadAndReloadTable()
            
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderBoardCell", for: indexPath) as? LeaderBoardViewCell{
            let lb: LeaderBoard!
            lb = leaderBoard[indexPath.row]
            cell.configureCell(lb)
            return cell;
        } else {
            return UITableViewCell()
        }
    }

    func downloadLeaderBoard(currentPage: Int, completion: @escaping (_ result: String) -> Void){
        let user = USERNAME
        let password = PASSWORD
        let stringUrl = "\(URL_BASE)\(currentPage)/"
        let url = URL(string: stringUrl)!
        var headers: HTTPHeaders = [:]
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        Alamofire.request(url, headers: headers).responseJSON { response in
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)
            if let jArray = json.array {
                for lb in jArray {
                    if let avatar = lb["avatar"].string, let point = lb["points"].int, let name = lb["name"].string {
                        let l = LeaderBoard(avatar: avatar, name: name, points: point, rank: self.globalRank)
                        //Append to array
                        self.leaderBoard.append(l)
                    }
                    self.globalRank = self.globalRank+1;
                }
            }
            completion("FINISHED")
        }
    }
    
    func downloadAndReloadTable(){
        downloadLeaderBoard(currentPage: currentLeaderBoard) {
            (result: String) in
            self.tableView.reloadData()
        }
    }
}

