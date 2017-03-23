//
//  FirstViewController.swift
//  Music Player
//
//  Created by Farshad Faradji on 22/03/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController , UITableViewDelegate ,UITableViewDataSource {
    
    var Songs: [String] = []
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSongName()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                    Songs.append(mySong)
                    print(mySong)
                }
            }
        } catch  {
            print("Error")
        }
    }

}

