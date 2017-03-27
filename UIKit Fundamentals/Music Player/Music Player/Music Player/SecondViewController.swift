//
//  SecondViewController.swift
//  Music Player
//
//  Created by Farshad Faradji on 22/03/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit
import  AVFoundation

class SecondViewController: UIViewController {

    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var volumeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songLabel.text = Songs[thisSong]
        imageView.image = UIImage(named: photo[songLabel.text!]!)
        volumeSlider.setThumbImage(UIImage(named: "volume"), for: .normal)
        timeSlider.setThumbImage(UIImage(named: "music"), for: .normal)
        updateTimeSlider()
        
    }
    var photo: [String :  String] = ["Alireza-JJ-Maro-Eshtebah-Nagir": "JJ",
                                     "Ho3ein-Ye-Joore-Digeh" : "Hosein",
                                     "Paydar-Yaghe" : "Paydar",
                                     "Tohi-Dorehami" : "Tohi",
                                     "Yas-Zende-Bad-Iran": "Yas" ]

    @IBAction func playSong(_ sender: UIButton) {
        if audioPlayer.isPlaying == false {
            audioPlayer.play()
            updateTimeSlider()
            songLabel.text = Songs[thisSong]
            imageView.image = UIImage(named: photo[songLabel.text!]!)
        }
    }
    @IBAction func pauseSong(_ sender: UIButton) {
        if audioPlayer.isPlaying == true {
            audioPlayer.pause()
            updateTimeSlider()
        }
    }
    @IBAction func prevSong(_ sender: UIButton) {
        if thisSong != 0 {
            playThis(thisOne: Songs[thisSong - 1])
            thisSong += 1
            songLabel.text = Songs[thisSong]
            imageView.image = UIImage(named: photo[songLabel.text!]!)
        }
        else {
         //   thisSong = Songs.count
        }
    }
    
    @IBAction func nextSOng(_ sender: UIButton) {
        if thisSong < Songs.count-1 {
            playThis(thisOne: Songs[thisSong + 1])
            thisSong += 1
            songLabel.text = Songs[thisSong]
            imageView.image = UIImage(named: photo[songLabel.text!]!)
        }
        else{
           // thisSong = 1
        }
    }
    
    func playThis(thisOne: String){
        do {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            updateTimeSlider()

        } catch  {
            print("Error")
        }
    }
    
    @IBAction func volumeSlider(_ sender: UISlider) {
        audioPlayer.volume = sender.value
        
    }
    
    @IBAction func timeSlider(_ sender: UISlider) {
        audioPlayer.currentTime = TimeInterval(sender.value)
//        sender.setValue(Float(audioPlayer.currentTime), animated: true)
    }
   public func updateTimeSlider(){
    
        timeSlider.minimumValue = 0
        timeSlider.maximumValue = Float(audioPlayer.duration)
        timeSlider.setValue(Float(audioPlayer.currentTime), animated: true)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

