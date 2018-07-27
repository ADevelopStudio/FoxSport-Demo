//
//  MatchView.swift
//  FoxSport Demo
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import UIKit

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
