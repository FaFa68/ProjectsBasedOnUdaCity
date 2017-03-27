//
//  FirstViewController.swift
//  Music Player
//
//  Created by Farshad Faradji on 22/03/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit
import AVFoundation

var Songs: [String] = []
var audioPlayer = AVAudioPlayer()
var thisSong = 0
let firstGradiantView = CAGradientLayer()
class FirstViewController: UIViewController , UITableViewDelegate ,UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstGradiantView.colors = [UIColor.black.cgColor , UIColor.yellow.cgColor]
        firstGradiantView.frame = view.frame
        view.layer.insertSublayer(firstGradiantView, at: 0)
        getSongName()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = Songs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        do {
            let audioPath = Bundle.main.path(forResource: Songs[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            thisSong = indexPath.row
        } catch  {
            print("Error")
        }
    }
   
    func getSongName() {
        let folderURL  = URL(fileURLWithPath:Bundle.main.resourcePath!)
        do {
           let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            for song in songPath {
                var mySong =  song.absoluteString
                if mySong.contains(".mp3") {
                    let findString = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count - 1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
//                    print(Songs.count)
                    Songs.append(mySong)
//                    print(mySong)
//                    print(Songs.count)
                }
            }
        } catch  {
            print("Error")
        }
    }

}

