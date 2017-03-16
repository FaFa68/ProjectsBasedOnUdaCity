//
//  RollDiceViewController.swift
//  Dice
//
//  Created by Farshad Faradji on 15/03/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit

class RollDiceViewController: UIViewController {

    @IBOutlet weak var firstDice: UIImageView!
    @IBOutlet weak var secondDice: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var RollDiceButton: UIButton!
    var firstValue: Int = 0
    var secondValue: Int = 0
    
    override func viewDidLoad() {
//        messageLabel.alpha = 0
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        firstDice.center.x      -= view.bounds.width
        secondDice.center.x     += view.bounds.width
        RollDiceButton.center.y += view.bounds.height
        messageLabel.center.y   -= view.bounds.height
        
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2.0, animations: {
        self.firstDice.center.x      += self.view.bounds.width
        self.secondDice.center.x     -= self.view.bounds.width
        self.RollDiceButton.center.y -= self.view.bounds.height
        self.messageLabel.center.y   += self.view.bounds.height
        })
    }
    // This method roll the dices
    @IBAction func rollDice(_ sender: UIButton) {
            let values = makeRandomIntLessThan7()
            firstDice.image  = UIImage(named: "d\(values.0)")
            secondDice.image = UIImage(named: "d\(values.1)")
        if values.0 == values.1 {
            messageLabel.text = "BingoOoOoO"
        } else {
            messageLabel.text = "Let's see"
        }
    }
    
    // Create Random Numbers less than 7
    func makeRandomIntLessThan7 () -> (Int, Int) {
        
        let firstInt  = Int(1 + arc4random() % 6)
        let secondInt = Int(1 + arc4random() % 6)
        return (firstInt , secondInt)
        
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
