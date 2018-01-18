//
//  APIClient.swift
//  MVDownloader
//
//  Created by Shibin Moideen on 1/18/18.
//  Copyright © 2018 Shibin Moideen. All rights reserved.
//

import UIKit
import Foundation

class APIClient: NSObject {
    
    private static let _sharedInstance = APIClient()
    let localCache = NSCache<AnyObject, AnyObject>()
    
    class func sharedInstance() -> APIClient {
        return _sharedInstance
    }
    
    func loadConentFromURL(url : URL, completionHandler:@escaping (Data, Error?) -> Swift.Void) {
        
        if let cachedResponse = localCache.object(forKey: url as AnyObject) {
            print("===== Content Loaded from Cache =====")
            completionHandler(cachedResponse as! Data, nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (responseData, response, err) in
            
            print("***** Content Loaded from Internet *****")
            guard let responseData = responseData else {
                return
            }
            
            let dataToCache = responseData
            self.localCache.setObject(responseData as AnyObject, forKey: url as AnyObject)
            
            completionHandler(dataToCache, nil)
            }.resume()
    }
}
