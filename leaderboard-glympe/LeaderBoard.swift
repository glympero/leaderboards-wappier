//
//  LeaderBoard.swift
//  leaderboard-glympe
//
//  Created by George Lymperopoulos on 26/11/2016.
//  Copyright © 2016 George Lymperopoulos. All rights reserved.
//

import Foundation

import Alamofire

class LeaderBoard {
    fileprivate var _avatar: String!
    fileprivate var _name: String!
    fileprivate var _points: Int!
    fileprivate var _rank: Int!
    
    var avatar: String {
        return _avatar
    }
    
    var name: String {
        return _name
    }
    
    var points: Int {
        return _points
    }
    
    var rank: Int {
        return _rank
    }
    
    init(avatar: String, name: String, points: Int, rank: Int) {
        self._avatar = avatar
        self._name = name
        self._points = points
        self._rank = rank
    }
}

