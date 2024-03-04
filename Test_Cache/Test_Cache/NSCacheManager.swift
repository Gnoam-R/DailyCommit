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
    private let cache = NSCache<NSString, NSData>()
    
    func cachedImage(urlString: String) -> UIImage? {
        let cachedKey = NSString(string: urlString)
        if let cachedImage = storage.object(forKey: cachedKey) {
            return cachedImage
        }
        return nil
    }
    
    func loadImage(from urlString: String, into imageView: UIImageView) {
        guard let url = URL(string: urlString)
        else {
            print("Failed to create URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard self != nil else { return }
            
            if let error = error {
                print("Failed to load image: \(error.localizedDescription)")
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("Failed to convert data to image")
                return
            }
            
            DispatchQueue.main.async {
                imageView.image = image
            }
            
            NSCacheManager.shared.setObject(image: image, urlString: urlString)
        }.resume()
    }
    
    func checkFile(url: URL?, completion: @escaping (Data) -> ()) {
        guard let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first,
              let url = url
        else {
            return
        }
        
        var filePath = URL(fileURLWithPath: cachesDirectory.path)
        filePath.appendPathComponent(url.lastPathComponent)
        
        // memory cache check

        let cachedKey = NSString(string: filePath.path)
        if let cachedData = cache.object(forKey: cachedKey) {
            let imageData = Data(referencing: cachedData)
            completion(imageData)
            return
        }
        
        // disk cache(file) check
        
        if FileManager.default.fileExists(atPath: filePath.path) {
            if let data = NSData(contentsOf: filePath) {
                cache.setObject(data, forKey: NSString(string: filePath.path))
                completion(Data(referencing: data))
                return
            }
        }
    }
    
    func loadImage(url: URL?, completion: @escaping (Data) -> ()) {
        guard let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first,
              let url = url 
        else {
            return
        }
        
        var filePath = URL(fileURLWithPath: cachesDirectory.path)
        filePath.appendPathComponent(url.lastPathComponent)
        
        // memory cache check

        let cachedKey = NSString(string: filePath.path)
        if let cachedData = cache.object(forKey: cachedKey) {
            let imageData = Data(referencing: cachedData)
            completion(imageData)
            return
        }
        
        // disk cache(file) check
        
        if FileManager.default.fileExists(atPath: filePath.path) {
            if let data = NSData(contentsOf: filePath) {
                cache.setObject(data, forKey: NSString(string: filePath.path))
                completion(Data(referencing: data))
                return
            }
        }
        
        // image download and file save, cache save
        
        URLSession.shared.downloadTask(with: url) { [weak self] url, response, error in
            guard let url = url,
                  let content = try? Data(contentsOf: url),
                  let cacheData = NSData(contentsOf: url) else { return }
            self?.cache.setObject(cacheData, forKey: NSString(string: filePath.path))
            FileManager.default.createFile(atPath: filePath.path, contents: content, attributes: nil)
            completion(content)
        }.resume()
    }
    
    func setObject(image: UIImage, urlString: String) {
        let forKey = NSString(string: urlString)
        self.storage.setObject(image, forKey: forKey)
    }
    
    
}
