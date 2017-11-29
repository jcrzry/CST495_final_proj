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

class AddRideViewController: UITableViewController, UITextFieldDelegate {
    
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
         navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddRideViewController.doneAction))    }
    
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
        timePicker.addTarget(self, action: #selector(AddRideViewController.startTimeDiveChanged), for: UIControlEvents.valueChanged)
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
    // MARK: Override Table View Function to insert Date View Controller

//    override func tableView(_ tableView: UITableView,
//                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 && indexPath.row == 3 {
//            return datePickerCell
//        } else {
//            return super.tableView(tableView, cellForRowAt: indexPath)
//        }
//    }
//    override func tableView(_ tableView: UITableView,
//                            numberOfRowsInSection section: Int) -> Int {
//        if section == 0 && datePickerVisible {
//            return 4
//        } else {
//            return 3
//        }
//    }
//    override func tableView(_ tableView: UITableView,
//                            heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 && indexPath.row == 3 {
//            return 217
//        } else {
//            return super.tableView(tableView, heightForRowAt: indexPath)
//        }
//    }
//    override func tableView(_ tableView: UITableView,
//                            didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        if indexPath.section == 0 && indexPath.row == 2 {
//            if !datePickerVisible {
//                showDatePicker()
//            } else {
//                hideDatePicker()
//            }
//        } }
//    override func tableView(_ tableView: UITableView,
//                            willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        if indexPath.section == 0 && indexPath.row == 2 {
//            return indexPath
//        } else {
//            return nil
//        }
//    }
//    override func tableView(_ tableView: UITableView,
//                            indentationLevelForRowAt indexPath: IndexPath) -> Int {
//        var newIndexPath = indexPath
//        if indexPath.section == 0 && indexPath.row == 3 {
//            newIndexPath = IndexPath(row: 0, section: indexPath.section)
//        }
//        return super.tableView(tableView,
//                               indentationLevelForRowAt: newIndexPath)
//    }

}
