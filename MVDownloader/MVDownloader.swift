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
        
        loadConentFromURL(url: url) { (responseData, err) in
            guard let image = UIImage.init(data: responseData) else {
                return
            }
            
            completionHandler(image, nil)
        }
    }
    
    public func loadJSONFromURL(url : URL, completionHandler:@escaping (String, Error?) -> Swift.Void) {
        loadConentFromURL(url: url) { (responseData, err) in
            guard let jsonString = String.init(data: responseData, encoding: .utf8) else {
                return
            }
            
            completionHandler(jsonString, nil)
        }
    }
    
    private func loadConentFromURL(url : URL, completionHandler:@escaping (Data, Error?) -> Swift.Void) {
        print(url)
        
        URLSession.shared.dataTask(with: url) { (responseData, response, err) in
            guard let responseData = responseData else {
                return
            }
            completionHandler(responseData, nil)
            }.resume()
    }
}
