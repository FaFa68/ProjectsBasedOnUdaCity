//
//  ViewController.swift
//  imagePicker
//
//  Created by Farshad Faradji on 17/03/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UINavigationControllerDelegate ,UIImagePickerControllerDelegate ,UITextFieldDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
        } else {
            // Error Message
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func pickImageFromAlbum(_ sender: UIBarButtonItem) {
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
        
    }

    @IBAction func pickImageFromCamera(_ sender: UIBarButtonItem) {
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func pickImageFromURL(_ sender: UIBarButtonItem) {
        
        let url = URL(string: "http://upload.wikimedia.org/wikipedia/commons/0/0c/Scarlett_Johansson_Césars_2014.jpg")!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: {
        (data , responce , error) in
            if data != nil {
                let image = UIImage(data: data!)
                if(image != nil) {
                    DispatchQueue.main.async(execute: {
                    self.imageView.image = image
                    })
                }
            }
        })
        task.resume()
    }
    
    @IBAction func shareImage(_ sender: UIBarButtonItem) {
        if let image = imageView.image {
            let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            self.present(controller, animated: true, completion: nil)
        }
    }
    @IBAction func addTextToPhoto(_ sender: UIBarButtonItem) {
        
        if textField.text != nil {
            textLabel.text = textField.text
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

