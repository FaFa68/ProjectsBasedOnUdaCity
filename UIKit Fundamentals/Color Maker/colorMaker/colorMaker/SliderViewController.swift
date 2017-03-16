//
//  SliderViewController.swift
//  colorMaker
//
//  Created by Farshad Faradji on 14/03/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var colorView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func colorMaker() {
        let red: CGFloat = CGFloat(redSlider.value)
        let blue: CGFloat = CGFloat(blueSlider.value)
        let green : CGFloat = CGFloat(greenSlider.value)
        
        colorView.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
    }

}
