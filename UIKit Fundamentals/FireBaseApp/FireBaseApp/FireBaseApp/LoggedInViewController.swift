//
//  LoggedInViewController.swift
//  FireBaseApp
//
//  Created by Farshad Faradji on 03/04/17.
//  Copyright © 2017 FaFa. All rights reserved.
//

import UIKit
import  FirebaseAuth
class LoggedInViewController: UIViewController {

    @IBAction func LogOut(_ sender: UIButton) {
    
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "LogOut", sender: self)
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
