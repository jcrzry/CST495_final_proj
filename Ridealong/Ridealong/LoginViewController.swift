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
        let signInEmail = usernameTF.text!
        let signInPassword = passwordTF.text!
        loginUser(username: signInEmail, password: signInPassword)
        NC.addObserver(forName: loginStatus, object: nil, queue: nil, using: getLoginStatus)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        performSegue(withIdentifier: "signUpPage", sender: nil)
    }
    
    func getLoginStatus(notification: Notification)->Void{
        //get login status boolean
        if let loginFailed = notification.userInfo?["loginFailed"] as? Bool{
            //handle failure
            if loginFailed == true{
                //show error
                createAlert(title: "Login Failed.", message: "Invalid credentials. Check credentials and try again.")
            }
            else{
                // handle success
                performSegue(withIdentifier: "mainPage", sender: nil)
            }
        }
       
    }
    
    
    func createAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
