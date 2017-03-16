//
//  ImagePickerViewController.swift
//  colorMaker
//
//  Created by Farshad Faradji on 14/03/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var photo: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showImagePicker(_ sender: UIButton) {
    
        let imagePickView = UIImagePickerController()
        self.present(imagePickView, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
