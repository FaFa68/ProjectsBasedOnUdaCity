//
//  ViewController.swift
//  imagePicker
//
//  Created by Farshad Faradji on 17/03/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func pickImageFromAlbum(_ sender: UIBarButtonItem) {
    }

    @IBAction func pickImageFromCamera(_ sender: UIBarButtonItem) {
    }
    @IBAction func pickImageFromURL(_ sender: UIBarButtonItem) {
    }
}

