//
//  ChoiceViewController.swift
//  Roshambo
//
//  Created by Farshad Faradji on 16/03/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    @IBAction func playRock(_ sender: UIButton) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ResultViewController")  as! ResultViewController
        viewController.userChoice =  getUserShape(sender)
        present(viewController, animated: true, completion: nil)
    }
    @IBAction private func playPaper(_ sender: UIButton){
        performSegue(withIdentifier: "play", sender: sender)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            let viewController = segue.destination as! ResultViewController
            viewController.userChoice = getUserShape(sender as! UIButton)
        }
    }

    private func getUserShape(_ sender: UIButton) -> Shape {
        let shape = sender.title(for: UIControlState())!
        return Shape(rawValue: shape)!
    }

}
