//
//  ViewController.swift
//  colorMaker
//
//  Created by Farshad Faradji on 14/03/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var greenswitch: UISwitch!
    @IBOutlet weak var redSwitch: UISwitch!
   
    @IBOutlet weak var colorView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func colorMaker() {
        
        let red: CGFloat = redSwitch.isOn ? 1 : 0
        let green : CGFloat = greenswitch.isOn ? 1 : 0
        let blue : CGFloat = blueSwitch.isOn ? 1 : 0
        colorView.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
//        if (redSwitch.isOn == false && greenswitch.isOn == false && blueSwitch.isOn == false) {
//            colorView.backgroundColor = UIColor.white
//        }
    }
    
}

