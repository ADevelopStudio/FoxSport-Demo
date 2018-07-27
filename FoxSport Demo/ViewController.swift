//
//  ViewController.swift
//  FoxSport Demo
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        ConnectionManager.getData { (results, error) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            print(error)
            print(results)
            results.forEach({
                print($0.statType)
            })
        }
    }
    
}

