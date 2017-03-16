//
//  ViewController.swift
//  Dice
//
//  Created by Farshad Faradji on 15/03/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit

class RollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This method creat random numbers for dices
    func createRandonIntLessThan6() -> Int {
        let randomValue = 1 + arc4random % 6
        return randomValue
    }

}

