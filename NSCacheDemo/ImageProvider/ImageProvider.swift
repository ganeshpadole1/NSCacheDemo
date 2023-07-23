//
//  ImageProvider.swift
//  NSCacheDemo
//
//  Created by Ganesh on 23/07/23.
//

import UIKit

enum ImageProviderError: Error {
    case invalidURL
}

class ImageProvider {
    
    static let shared = ImageProvider()
    
    var cache = NSCache<NSString, UIImage>()
    
    private init() {
        
    }
    
    public func fetchImage(completion: @escaping(Result<UIImage, ImageProviderError>) -> Void) {
        
        if let chacheImage = cache.object(forKey: "image") {
            print("from chache")
            completion(.success(chacheImage))
            return
        }
     
        guard let url = URL(string: "https://picsum.photos/200/300?grayscale") else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }

            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.cache.setObject(image, forKey: "image")
                    print("from server")
                    completion(.success(image))
                }
            }
        }
        
        task.resume()
        
    }
}
