//
//  PlayerViewModel.swift
//  FoxSport Demo
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation
import UIKit

extension PlayerView {
    func fillWith(_ playerData: PlayerData, onTap: @escaping (PlayerData)->())  {
        self.onTap = onTap
        self.playerData = playerData
        self.name.text = playerData.player.shortName
        self.jumperNumber.text = "👕: \(playerData.player.jumperNumber)"
        self.statValue.text = "📈: \(playerData.player.statValue)"
        self.position.text = playerData.player.position
        ImageLoader().downloadPlayerPhoto(player: playerData.player, completion: {self.profilePic.image = $0})
    }
}
