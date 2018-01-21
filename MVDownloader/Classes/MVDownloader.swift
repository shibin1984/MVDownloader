//
//  MVDownloader.swift
//  MVDownloader
//
//  Created by Shibin Moideen on 1/18/18.
//  Copyright © 2018 Shibin Moideen. All rights reserved.
//

import UIKit
import Foundation

open class MVDownloader {
    
    public init() {
    }

    open func loadImageFromURL(_ url : URL, completionHandler:@escaping (UIImage, Error?) -> Swift.Void) {
        
        APIClient.sharedInstance().loadConentFromURL(url) { (responseData, err) in
            guard let image = UIImage.init(data: responseData) else {
                return
            }
            
            completionHandler(image, nil)
        }
    }
    
    open func loadJSONFromURL(_ url : URL, completionHandler:@escaping (Data?, Error?) -> Swift.Void) {
        
        APIClient.sharedInstance().loadConentFromURL(url) { (responseData, err) in
            completionHandler(responseData, nil)
        }
    }
}
