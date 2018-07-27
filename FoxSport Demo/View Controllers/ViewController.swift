//
//  ViewController.swift
//  FoxSport Demo
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
    }
    
    func loadData()  {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        ConnectionManager.getData { (matches, error) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            matches.forEach({
                self.resultStackView.addArrangedSubview($0.toMatchView(ontap: {self.performSegue(withIdentifier: "details", sender: $0)}))
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? PlayerDetailsVC, let playerData = sender as? PlayerData {
            destinationVC.playerData = playerData
        }
    }
    
}

