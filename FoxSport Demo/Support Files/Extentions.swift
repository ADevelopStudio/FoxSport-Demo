//
//  Extentions.swift
//  FoxSport Demo
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation

extension Array where Element == StatType {
    func toBaseUrl(limit: Int = 5) -> URL? {
        if self.isEmpty {return nil}
        return URL(string: "\(ConnectionManager.dataBaseUrl)\(self.map({";type=\($0.rawValue)"}).joined())?limit=\(limit)&userkey=\(ConnectionManager.userkey)")
    }
}
