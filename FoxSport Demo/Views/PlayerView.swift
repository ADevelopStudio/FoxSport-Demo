//
//  PlayerView.swift
//  FoxSport Demo
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import UIKit
extension PlayerView {
    func fillWith(_ player: Player, onTap: @escaping ()->())  {
        self.onTap = onTap
        self.name.text = player.shortName
        self.jumperNumber.text = "Jumper: \(player.jumperNumber)"
        self.statValue.text = "Stats: \(player.statValue)"
        self.position.text = player.position
    }
}

class PlayerView: UIView {
    var onTap: (()->())? = nil
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var jumperNumber: UILabel!
    @IBOutlet weak var statValue: UILabel!
    @IBOutlet weak var position: UILabel!
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        print("TAPPED")
        self.onTap?()
    }
}
