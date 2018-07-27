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
        return URL(string: "\(ConnectionManager.dataBaseUrl)\(self.map({";type=\($0.rawValue)"}).joined())?limit=\(limit)&userkey=\(ConnectionManager.getDataUserKey)")
    }
}
extension String {
    func capitalizingFirstLetter() -> String {
        return "\(prefix(1).uppercased())\(dropFirst())"
    }
}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    func setCorner(cornerRadius: CGFloat = 7, borderWidth: CGFloat = 1, borderColor: UIColor = .clear)  {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.clipsToBounds = true
    }
}

extension Match {
    func toMatchView(ontap: @escaping (PlayerData)->()) -> MatchView {
        let matchView: MatchView = .fromNib()
        matchView.fillWith(match: self, ontap: ontap)
        return matchView
    }
}

extension Player {
    func toPlayerView(teamId:Int, ontap: @escaping (PlayerData)->()) -> PlayerView {
        let playerView: PlayerView = .fromNib()
        playerView.setCorner()
        playerView.fillWith(PlayerData(player: self, teamId: teamId), onTap: ontap)
        return playerView
    }
}
