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

class AddViewController: UIViewController, UITextFieldDelegate {
    
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
        view.backgroundColor = UIColor.white
        setupTextField()
        setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) { // [2]
        super.viewDidAppear(animated)
       //Keyboard pop up right after view load
        txtLocationFrom?.becomeFirstResponder()
    }
    
    // MARK: datepicker function
    func displayDate(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //button to click when done
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePick))
        toolbar.setItems([doneBtn], animated: false)
        
        //Yet to find out if you can load both in same func
        txtDate.inputAccessoryView = toolbar
        txtTime.inputAccessoryView = toolbar
        txtDate.inputView = datePicker
        self.timePicker.datePickerMode = .time
        
        txtTime.inputView = timePicker
    }
    func donePick(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        txtDate.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    func openTimePicker()  {
        timePicker.datePickerMode = UIDatePickerMode.time
        timePicker.frame = CGRect(x: 0.0, y: (self.view.frame.height/2 + 60), width: self.view.frame.width, height: 150.0)
        timePicker.backgroundColor = UIColor.white
        self.view.addSubview(timePicker)
        timePicker.addTarget(self, action: #selector(AddViewController.startTimeDiveChanged), for: UIControlEvents.valueChanged)
    }
    
    func startTimeDiveChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        txtTime.text = formatter.string(from: sender.date)
    } 
    func setupTextField() {
        
        txtLocationFrom?.placeholder = "From where are we driving?"
        txtLocationTo?.placeholder = "To where are we going?"
        txtDescription?.placeholder = "Where are we meeting?"
        
        //Set delegate to know when the user hits return key
        txtLocationFrom?.delegate = self
        txtLocationTo?.delegate = self
        txtDescription?.delegate = self
        txtDate?.delegate = self
        view.addSubview(txtLocationFrom!)
        view.addSubview(txtLocationTo!)
        view.addSubview(txtDescription!)
        view.addSubview(txtDate!)
        view.addSubview(txtTime!)
        //May not be needed
        view.addSubview(txtDate!)
    }
    
    //Done button
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddViewController.doneAction))
    }
    func doneAction() {
       let realm = try! Realm()
        if (self.txtLocationFrom?.text?.characters.count)! > 0 {
            let newRide = Ride()
         
         //   newRide.date = self.txtLocationFrom!.text
            realm.add(newRide)

           
        }
        // Go back to previous view
        dismiss(animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // [8]
        doneAction()
        textField.resignFirstResponder()
        return true
    }
}
