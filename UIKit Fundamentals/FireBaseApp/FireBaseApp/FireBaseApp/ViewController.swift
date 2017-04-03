//
//  ViewController.swift
//  FireBaseApp
//
//  Created by Farshad Faradji on 03/04/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit
import  FirebaseAuth
class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setButtonTittle(segmentControl)
    }

    @IBAction func action(_ sender: UIButton) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            if segmentControl.selectedSegmentIndex == 0 { // Sign in Segment
                FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {(user , error) in
                    if user != nil {
                        // Sign in successful
                        print("Succesfully Signed in")
                        
                    } else {
                        if let err = error?.localizedDescription {
                            
                            print(err)
                        }
                        else {
                            print("Error")
                        }
                    }
                })
                
            } else {        // Sign up Segment
                
                FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {(user , error) in
                    if user != nil {
                        // Sign in successful
                        print("Successfully Signed up")
                    } else {
                        if let err = error?.localizedDescription {
                            
                            print(err)
                        }
                        else {
                            print("Error")
                        }
                    }
                })
            }
        }
    }
    @IBAction func setButtonTittle(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            actionButton.setTitle("Login", for: .normal)
        } else {
            actionButton.setTitle("Sign Up", for: .normal)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

