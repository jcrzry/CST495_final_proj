//
//  LoginViewController.swift
//  Ridealong
//
//  Created by Alfonso Torres on 9/24/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import UIKit
import TB

class LoginViewController: UIViewController{
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var userNameLabel: UILabel!
    var userName:String = "Stranger!"
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        userNameLabel.text = userName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    @IBAction func signInButton(_ sender: Any) {
        
        performSegue(withIdentifier: "mainPage", sender: nil)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        performSegue(withIdentifier: "signUpPage", sender: nil)
    }
  

}
