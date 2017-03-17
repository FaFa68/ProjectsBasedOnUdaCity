//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Farshad Faradji on 16/03/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit

enum Shape: String {
    case Rock     = "Rock"
    case Paper    = "Paper"
    case Scissors = "Scissors"
    
    // This function randomly generates an opponent's play
    static func randomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
}

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
 
    var userChoice : Shape!
    let computerChoice = Shape.randomShape()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resultValue()
    }
    
    private func resultValue() {
        
        var imageName: String
        var resultMessage: String
        switch (userChoice! , computerChoice) {
        case (.Rock , .Rock),(.Paper , .Paper),(.Scissors , .Scissors):
            imageName = "tie"
            resultMessage = "Draw"
        case (.Rock , .Scissors) , (.Paper , .Rock) , (.Scissors , .Paper):
            imageName = "\(userChoice.rawValue)-\(computerChoice.rawValue)"
            resultMessage = "You Won"
        default:
            imageName = "\(userChoice.rawValue)-\(computerChoice.rawValue)"
            resultMessage = "You Lost"
        }
        imageName = imageName.lowercased()
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = resultMessage
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
}
