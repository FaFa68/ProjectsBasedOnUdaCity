//
//  TimerViewController.swift
//  CountDownTimer
//
//  Created by Farshad Faradji on 18/03/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
   
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var secondsSlider: UISlider!
    
    var seconds = 30
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sliderTimer(_ sender: UISlider) {
        
        seconds = Int(secondsSlider.value)
        secondsLabel.text = "\(seconds) Seconds"
    }
    
    @IBAction func startTimer(_ sender: UIButton) {
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(TimerViewController.count),
                                     userInfo: nil, repeats: true)

        startButton.alpha = 0.2
        startButton.isEnabled = false
        secondsSlider.alpha = 0.2
        secondsSlider.isEnabled = false

    }
    func count() {
            seconds -= 1
            secondsLabel.text = "\(seconds)"
        if seconds == 0 {
            timer.invalidate()

            startButton.isEnabled = true
            startButton.alpha = 1
            secondsSlider.isEnabled = true
            secondsSlider.alpha = 1
        }
            
}
    
    @IBAction func stopTimer(_ sender: UIButton) {
        
        timer.invalidate()
        
        secondsSlider.setValue(30, animated: true)
        secondsLabel.text = "30 Seconds"
        
        secondsSlider.isEnabled = true
        secondsSlider.alpha = 1
        startButton.isEnabled = true
        startButton.alpha = 1

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
