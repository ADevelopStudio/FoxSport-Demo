//
//  Codable.swift
//  FoxSport Demo
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation

struct Player: Codable {
    var id: Int
    var position: String
    var fullName: String
    var shortName: String
    var statValue: Int
    var jumperNumber: Int
}

struct Team: Codable {
    var id: Int
    var name: String
    var code: String
    var shortName: String
    var topPlayers: [Player]
}

struct SearchResult: Codable {
    var matchId: String
    var teamA: Team
    var teamB: Team
    var statType: String
}