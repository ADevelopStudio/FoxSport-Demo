//
//  MatchView.swift
//  FoxSport Demo
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import UIKit
extension MatchView {
    func fillWith(match: Match, ontap: @escaping (PlayerData)->())  {
        type.text = match.statType.displayName
        teamAName.text = match.teamA.shortName
        teamBName.text = match.teamB.shortName
        match.teamA.topPlayers.forEach({teamAStack.addArrangedSubview($0.toPlayerView(teamId: match.teamA.id, ontap: ontap))})
        match.teamB.topPlayers.forEach({teamBStack.addArrangedSubview($0.toPlayerView(teamId: match.teamB.id, ontap: ontap))})
    }
}

class MatchView: UIView {
    @IBOutlet weak var teamAStack: UIStackView!
    @IBOutlet weak var teamBStack: UIStackView!
    @IBOutlet weak var teamAName: UILabel!
    @IBOutlet weak var teamBName: UILabel!
    @IBOutlet weak var type: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
}
