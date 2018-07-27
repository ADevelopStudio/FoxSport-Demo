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
    
    @IBOutlet weak var playerProfilePic: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var lastGameStat: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let playerData = playerData else {return}
        self.fillData(with: playerData)
    }
    
    func fillData(with playerData: PlayerData)  {
        self.title = playerData.player.shortName
        self.fullName.text = playerData.player.fullName
        self.position.text = playerData.player.position
        ImageLoader().downloadPlayerPhoto(player: playerData.player, completion: {self.playerProfilePic.image = $0})
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        playerData.getPlayerDetails { stat in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            guard let stat = stat else {return}
            let prettyText = stat.compactMap({"\($0.key): \($0.value)"}).joined(separator: "\n")
            self.lastGameStat.text = prettyText
        }
    }
}
