//
//  ChacheManager.swift
//  Test_Cache
//
//  Created by Roh on 3/4/24.
//

import Foundation
import UIKit

class NSCacheManager {
    static let shared = NSCacheManager()
    
    private let storage = NSCache<NSString, UIImage>()
    
    func cachedImage(urlString: String) -> UIImage? {
        let cachedKey = NSString(string: urlString)
       if let cachedImage = storage.object(forKey: cachedKey) {
           return cachedImage
       }
       return nil
    }
    
    func setObject(image: UIImage, urlString: String) {
        let forKey = NSString(string: urlString)
        self.storage.setObject(image, forKey: forKey)
    }
}
