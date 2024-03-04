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
    
    let storage = NSCache<NSString, UIImage>()
    private let nsCache = NSCache<NSString, NSData>()
    
    func checkFile(url: URL, completion: @escaping (Data) -> ()) {
        guard let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        else {
            return
        }
        
        var filePath = URL(fileURLWithPath: cachesDirectory.path)
        filePath.appendPathComponent(url.lastPathComponent)
        
        // memory cache check

//        let cachedKey = NSString(string: filePath.path)
//        if let cachedData = nsCache.object(forKey: cachedKey) {
//            let imageData = Data(referencing: cachedData)
//            completion(imageData)
//            return
//        }
        
        // disk cache(file) check
        
        if FileManager.default.fileExists(atPath: filePath.path) {
        
            if let data = NSData(contentsOf: filePath) {
                completion(Data(referencing: data))
                return
            }
        }
    }
    
    func loadImage(url: URL, completion: @escaping (Data) -> ()) {
        guard let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        else {
            return
        }

        var filePath = URL(fileURLWithPath: cachesDirectory.path)
        filePath.appendPathComponent(url.lastPathComponent)

        // image download and file save, cache save
        
        URLSession.shared.downloadTask(with: url) { [weak self] url, response, error in
            guard let url = url,
                  let content = try? Data(contentsOf: url),
                  let cacheData = NSData(contentsOf: url) else { return }
            self?.nsCache.setObject(cacheData, forKey: NSString(string: filePath.path))
            FileManager.default.createFile(atPath: filePath.path, contents: content, attributes: nil)
            completion(content)
        }.resume()
    }
}
