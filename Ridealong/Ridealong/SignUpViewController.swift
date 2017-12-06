//
//  SignUpViewController.swift
//  Ridealong
//
//  Created by Alfonso Torres/Jcrzry on 11/9/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import UIKit
import TB

class SignUpViewController: UIViewController {
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var retypePassword: UITextField!
    @IBOutlet weak var passwordReq: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        passwordReq.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Using this before segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let loginVC = segue.destination as! LoginViewController
        if !retypePassword.text!.isEmpty && retypePassword.text! == password.text!{
            loginVC.userName = firstName.text!
            loginVC.userName += "!"
        }
    }
    
    
    // handle notification for register status
    func getRegisterStatus(notification: Notification) -> Void{
        //get register status boolean
        if let registerFailed = notification.userInfo?["registerFailed"] as? Bool {
            //handle register failure
            if  registerFailed == true{
                //show error
                createAlert(title: "User Exists", message: "User with this email already exists. Try another or Login instead.")
            }else{
                let commonRealm = getCommonRealm()
                if let selfUser = notification.userInfo?["user"] as? User{
                    //var simUser = selfUser.toSimpleUser()
                    try! commonRealm.write{
                       // commonRealm.add(simUser)
 
                    }
                    performSegue(withIdentifier: "loginPage", sender: nil)
                }else{
                    print("no user passed")
                }
                
            }
        }else{
            print("message did not contain any information")
        }
    }
    
    //After entering information the user goes back to login screen to log in
    @IBAction func enterInfo(_ sender: Any) {
        if !firstName.text!.isEmpty && !lastName.text!.isEmpty{
            if !phoneNumber.text!.isEmpty && phoneNumber.text!.count == 10{
                var x:Bool
                x=isValid(email.text!)
                if !email.text!.isEmpty && x==true{
                        x=false
                        x=isValidPassword(testStr: password.text!)
                        if !password.text!.isEmpty && x==true {
                            if !retypePassword.text!.isEmpty && retypePassword.text! == password.text!{
                                //critical section, will execute on click if all fields are correct.
                                print("inside valid entries")
                                let me = User(firstname: firstName.text!, lastname: lastName.text!, email: email.text!, password: password.text!, phone: phoneNumber.text!)
                                registerUser(newUser: me!)
                                NC.addObserver(forName: registerStatus, object:nil, queue:nil, using: getRegisterStatus)
                            }else{
                                createAlert(title: "Invalid Password Entry",
                                            message: "Retype password does not equal password.")
                            }
                        }else{
                            passwordReq.isHidden = false
                            createAlert(title: "Invalid Password Entry",
                                        message: "Your password does not meet the recommended requirements.")
                        }
                }else{
                    createAlert(title: "Invalid Email Entry",
                                message: "We need the correct email format.")
                }
            }else{
                createAlert(title: "Invalid Phone Number Entry",
                            message: "We need ten digits to complete your phone number.")
            }
        }else {
            createAlert(title: "Invalid Name Entry",
                        message: "You didn't give us a full name. Stop being lazy and give us your full name.")
        }
    }
    
    //User function to go back to login without signing up
    @IBAction func goBack(_ sender: Any) {
        performSegue(withIdentifier: "loginPage", sender: nil)
    }
    
    //Alert function to ask for correct information from user
    func createAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //Checking if email is valid
    func isValid(_ email: String) -> Bool {
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    //Checking if password is valid
    func isValidPassword(testStr:String?) -> Bool {
        guard testStr != nil else { return false }
        
        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: testStr)
    }
}
