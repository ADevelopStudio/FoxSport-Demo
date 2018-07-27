//
//  Codable.swift
//  FoxSport Demo
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation

enum StatType: String, Codable {
    static let allValues = [StatType.fantasyPoints, .tackles, .runs, .runMetres]
    case runMetres = "run_metres", fantasyPoints = "fantasy_points", runs = "runs", tackles = "tackles"
    var displayName: String {
        return self.rawValue.split(separator: "_").map({"\($0)".capitalizingFirstLetter()}).joined(separator: " ")
    }
}

struct PlayerData {
    var player:Player
    var teamId:Int
    
    func getPlayerDetails(_ completion: @escaping (_ lastStat:  [String: Any]?)->()) {
        ConnectionManager.getPlayerDetails(playerData: self, completion: completion)
    }
}

struct PlayerDetails: Codable {
    var id: Int
    var position: String
    var fullName: String
    var lastMatchStats: Dictionary<String,String?>
}

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

struct Match: Codable {
    var matchId: String
    var teamA: Team
    var teamB: Team
    var statType: StatType
}
