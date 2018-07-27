//
//  ViewController.swift
//  FoxSport Demo
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    var matches =  Array<Match>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.backgroundColor = .groupTableViewBackground
        self.loadData()
    }
    
    func loadData()  {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        ConnectionManager.getData { (matches, error) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            print(error)
            print(matches)
            matches.forEach({
                print($0.statType)
            })
            self.matches = matches
            self.table.reloadData()
        }
    }
    
}

