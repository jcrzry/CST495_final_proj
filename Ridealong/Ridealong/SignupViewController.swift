//
//  SignupViewController.swift
//  Ridealong
//
//  Created by Alfonso Torres on 9/26/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//
import UIKit

class SignupViewController: UIViewController {
    @IBOutlet weak var firstTF: UITextField!
    @IBOutlet weak var lastTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var usernameTF2: UITextField!
    //needs to be the same as the one before
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordTF2: UITextField!
    //needs to be the same as the one before
    
    
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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Send out information before I segue!
        let logVC = segue.destination as! LoginViewController
        logVC.un = usernameTF.text!
        logVC.pw = passwordTF.text!
        
        
    }
    
    @IBAction func submitButton(_ sender: Any) {
        if firstTF.text != "First" && lastTF.text != "Last" {
            if emailTF.text != "" {
                if usernameTF.text != "" && usernameTF2.text != "" && usernameTF.text==usernameTF2.text {
                    if passwordTF.text != "" && passwordTF2.text != "" && passwordTF.text==passwordTF2.text {
                        //Once it goes through all my conditions it should assume that the user has entered the information correctly and segue
                        //*Learn how to dismiss keyboard*
                        performSegue(withIdentifier: "signupDone", sender: self)
                        //this will go back to login
                    }
                    else{
                        //Create toast incase password info is not presented
                        print("incorrect password info");
                    }
                }
                else{
                    //Create toast incase username info is not presented
                    print("incorrect username info");
                }
            }
            else{
                //Create toast incase email info is not presented
                print("incorrect email info");
            }
        }
        else{
            //Create toast incase name info is not presented
            print("incorrect name info");
        }
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
