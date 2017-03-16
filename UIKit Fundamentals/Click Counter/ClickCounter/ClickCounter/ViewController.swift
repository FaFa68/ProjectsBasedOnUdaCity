//
//  ViewController.swift
//  ClickCounter
//
//  Created by Farshad Faradji on 14/03/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    var count : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       button.addTarget(self, action: #selector(ViewController.increment), for: UIControlEvents.touchUpInside)
        decreaseButton.addTarget(self, action: #selector(decrease), for: UIControlEvents.touchUpInside)
      //  resetButton.addTarget(self, action: #selector(reset), for: UIControlEvents.touchUpInside)
        
    }
    func increment() {
        count = Int(label.text!)!
        count += 1
        label.text! = String(count)
    }
    
    func decrease() {
        count = Int(label.text!)!
        count -= 1
        label.text! = String(count)
    }
    
   @IBAction func reset() {
        label.text! = "0"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

