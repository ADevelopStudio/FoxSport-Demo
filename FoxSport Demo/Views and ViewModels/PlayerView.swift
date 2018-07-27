//
//  PlayerView.swift
//  FoxSport Demo
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import UIKit


class PlayerView: UIView {
    var onTap: ((PlayerData)->())? = nil
    var playerData: PlayerData?
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var jumperNumber: UILabel!
    @IBOutlet weak var statValue: UILabel!
    @IBOutlet weak var position: UILabel!
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        guard let playerData = playerData else {return}
        self.onTap?(playerData)
    }
}
