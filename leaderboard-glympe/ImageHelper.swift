//
//  ImageHelper.swift
//  leaderboard-glympe
//
//  Created by George Lymperopoulos on 27/11/2016.
//  Copyright © 2016 George Lymperopoulos. All rights reserved.
//

import Foundation
import UIKit

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
