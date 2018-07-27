//
//  ImageLoader.swift
//  FoxSport Demo
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation
import UIKit

struct Cache {
    static var imageCache = NSCache<NSString, UIImage>()
}

struct ImageLoader {
    let emptyImagePath = "http://media.foxsports.com.au/match-centre/includes/images/headshots/headshot-blank-large.jpg"
    
    func downloadPlayerPhoto(player: Player, completion: @escaping (UIImage?)->()) {
        guard let url = URL(string: "http://media.foxsports.com.au/match-centre/includes/images/headshots/landscape/nrl/\(player.id).jpg") else {
            self.getEmptyImage(completion: completion)
            return
        }
        if let cachedImage = Cache.imageCache.object(forKey:  url.absoluteString as NSString) {
            completion(cachedImage)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                self.getEmptyImage(completion: completion)
                return
            }
            guard let img = UIImage(data: data) else {
                self.getEmptyImage(completion: completion)
                return
            }
            DispatchQueue.main.async {
                completion(img)
                Cache.imageCache.setObject(img, forKey:  url.absoluteString as NSString)
            }
        }.resume()
    }
    
    func getEmptyImage(completion: @escaping (UIImage?)->()) {
        guard let url = URL(string: self.emptyImagePath) else {
            DispatchQueue.main.async {completion(nil)}
            return
        }
        if let cachedImage = Cache.imageCache.object(forKey:  url.absoluteString as NSString) {
            DispatchQueue.main.async {completion(cachedImage)}
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {completion(nil)}
                return
            }
            let img = UIImage(data: data)
            DispatchQueue.main.async {
                completion(img)
                if img != nil {
                    Cache.imageCache.setObject(img!, forKey:  url.absoluteString as NSString)
                }
            }
            }.resume()
    }
}
