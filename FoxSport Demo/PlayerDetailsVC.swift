//
//  PlayerDetailsVC.swift
//  FoxSport Demo
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import UIKit

class PlayerDetailsVC: UIViewController {
    var playerData: PlayerData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = playerData?.player.shortName ?? "Player"
    }
}
