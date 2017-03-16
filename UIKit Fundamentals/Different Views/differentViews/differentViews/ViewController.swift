//
//  ViewController.swift
//  differentViews
//
//  Created by Farshad Faradji on 15/03/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CameraRoll: UIButton!
    @IBOutlet weak var alertButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showCameraRoll(_ sender: UIButton) {
        let imagepicker = UIImagePickerController()
        self.present(imagepicker, animated: true, completion: nil)
    }
    @IBAction func showAlertView(_ sender: UIButton) {
        let alertView = UIAlertController()
        alertView.title = "Test Alert"
        alertView.message = "No Way Out"
        self.present(alertView, animated: true, completion: nil)
        
    }

    @IBAction func showActivityView(_ sender: UIButton) {
        let image = UIImage()
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
    }
}

