//
//  LoginViewController.swift
//  Ridealong
//
//  Created by Alfonso Torres on 9/24/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var un:String = "Username"
    var pw:String = "Password"
    
    
    //USE info above to see if we have the correct info
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
        //Dismiss Keyboard
    }
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        //Check if the user has input any text
        if(usernameTF.text==un&&passwordTF.text==pw){
            performSegue(withIdentifier: "mainPage", sender: self)
        }
        else {
            print("Incorrect Username or Password")
        }

    }
    @IBAction func signupButton(_ sender: Any) {
        //Should take user to sign up sheet
    }
    


}
