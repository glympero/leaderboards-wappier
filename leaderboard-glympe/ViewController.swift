//
//  ViewController.swift
//  leaderboard-glympe
//
//  Created by George Lymperopoulos on 26/11/2016.
//  Copyright © 2016 George Lymperopoulos. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let user = "test_me"
        let password = "G00dw11L"
        var headers: HTTPHeaders = [:]
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        Alamofire.request("https://test.wappier.com/api/leaderboard/1", headers: headers).responseJSON { response in
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

