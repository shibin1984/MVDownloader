//
//  MVDownloader.swift
//  MVDownloader
//
//  Created by Shibin Moideen on 1/18/18.
//  Copyright © 2018 Shibin Moideen. All rights reserved.
//

import UIKit
import Foundation

public class MVDownloader {
    
    public init() {
    }

    public func loadImageFromURL(url : URL, completionHandler:@escaping (UIImage, Error?) -> Swift.Void) {
        
        APIClient.sharedInstance().loadConentFromURL(url: url) { (responseData, err) in
            guard let image = UIImage.init(data: responseData) else {
                return
            }
            
            completionHandler(image, nil)
        }
    }
    
    public func loadJSONFromURL(url : URL, completionHandler:@escaping (String, Error?) -> Swift.Void) {
        APIClient.sharedInstance().loadConentFromURL(url: url) { (responseData, err) in
            guard let jsonString = String.init(data: responseData, encoding: .utf8) else {
                return
            }
            
            completionHandler(jsonString, nil)
        }
    }
}
