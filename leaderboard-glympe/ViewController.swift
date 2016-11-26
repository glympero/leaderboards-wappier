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


class ViewController: UIViewController {
    
    let currentLeaderBoard = 0
    var leaderBoard = [LeaderBoard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadLeaderBoard() {
            (result: String) in
                print(self.leaderBoard[0].avatar)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func refreshTable(_ sender: Any) {
        print(leaderBoard[0].avatar)
    }
    
    func test(){
        print("After")
    }
    func downloadLeaderBoard(completion: @escaping (_ result: String) -> Void){
        let currentPage = 0
        let user = "test_me"
        let password = "G00dw11L"
        let stringUrl = "\(URL_BASE)\(currentPage)/"
        let url = URL(string: stringUrl)!
        var headers: HTTPHeaders = [:]
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        Alamofire.request(url, headers: headers).responseJSON { response in
            guard let object = response.result.value else {
                print("Oh, no!!!")
                return
            }
            let json = JSON(object)
            if let jArray = json.array {
                var index = 1;
                for lb in jArray {
                    if let avatar = lb["avatar"].string, let point = lb["points"].int, let name = lb["name"].string {
                        let l = LeaderBoard(avatar: avatar, name: name, points: point, rank: index)
                        //Append to array
                        self.leaderBoard.append(l)
                    }
                    index = index+1;
                }
            }
            completion("we finished!")
        }
    }
}

