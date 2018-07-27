//
//  MatchCell.swift
//  FoxSport Demo
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import UIKit
extension MatchCell {
    func fillWith(match: Match, ontap: @escaping ()->())  {
        match.teamA.topPlayers.forEach({teamAStack.addArrangedSubview($0.toPlayerView(ontap: ontap))})
        match.teamB.topPlayers.forEach({teamBStack.addArrangedSubview($0.toPlayerView(ontap: ontap))})
    }
}

class MatchCell: UITableViewCell {
    @IBOutlet weak var teamAStack: UIStackView!
    @IBOutlet weak var teamBStack: UIStackView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
}
