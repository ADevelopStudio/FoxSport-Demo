//
//  Extentions.swift
//  FoxSport Demo
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation
import UIKit
extension Array where Element == StatType {
    func toBaseUrl(limit: Int = 5) -> URL? {
        if self.isEmpty {return nil}
        return URL(string: "\(ConnectionManager.dataBaseUrl)\(self.map({";type=\($0.rawValue)"}).joined())?limit=\(limit)&userkey=\(ConnectionManager.userkey)")
    }
}
extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

extension Player {
    func toPlayerView(ontap: @escaping ()->()) -> PlayerView {
        let playerView: PlayerView = .fromNib()
        playerView.fillWith(self, onTap: ontap)
        return playerView
    }
}
