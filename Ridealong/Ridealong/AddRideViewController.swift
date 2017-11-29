//
//  AddRideViewController.swift
//  Ridealong
//
//  Created by Simon Nielsen on 22/10/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import UIKit
import Realm
import RealmSwift
import TB

class AddRideViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Variables
    @IBOutlet var txtDate: UITextField!
    @IBOutlet var txtTime: UITextField!
    var datePicker = UIDatePicker()
    var timePicker = UIDatePicker()
    var txtLocationFrom: UITextField?
    var txtLocationTo: UITextField?
    var txtDescription: UITextField?
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        AddRideViewController(nibName: "AddRideView", bundle: nil)
        view.backgroundColor = UIColor.white
         navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddRideViewController.doneAction))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

       //Keyboard pop up right after view load
        txtLocationFrom?.becomeFirstResponder()
    }
    
    // MARK: datepicker function
    func displayDate(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //button to click when done
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneAction))
        toolbar.setItems([doneBtn], animated: false)

        txtDate.inputAccessoryView = toolbar
        txtTime.inputAccessoryView = toolbar
        txtDate.inputView = datePicker
        self.timePicker.datePickerMode = .time
        
        txtTime.inputView = timePicker
    }
    func doneAction() {
        TB.temp("doneAction tapped")
        let newViewController = collectionViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // [8]
        doneAction()
        textField.resignFirstResponder()
        return true
    }
}
