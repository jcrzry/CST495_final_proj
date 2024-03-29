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
import MapKit

class AddRideViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Variables
    @IBOutlet var txtDate: UITextField!
    @IBOutlet var txtTime: UITextField!
    var datePicker = UIDatePicker()
    var timePicker = UIDatePicker()
    var txtLocationFrom: UITextField?
    var txtLocationTo: UITextField?
    var txtDescription: UITextField?
    
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var startLocation: UITextField!
    @IBOutlet weak var destinationLocation: UITextField!
    
    @IBOutlet weak var notes: UITextView!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
         navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddRideViewController.doneAction))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

       //Keyboard pop up right after view load
        txtLocationFrom?.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //getCoordinates(address: <#T##String#>)
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
        let driver = driverData(id: "3", image: nil, imageId: "", firstName: "Simon", lastName: "Nielson", displayName: "Simon Nielson", rideID: ["1"])
        //, rideDate: startDate.date, from: (startLocation.text!), to: (destinationLocation.text!), notes: (notes.text!)
        demoDrivers.append(driver)
        self.navigationController?.popViewController(animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // [8]
        doneAction()
        textField.resignFirstResponder()
        return true
    }
    
    
//    func getCoordinates(address: String) -> Locations{
//        let geocoder = CLGeocoder()
//        geocoder.geocodeAddressString(address, completionHandler:{
//            placemarks, error in
//            if error == nil{
//                if let placemarks = placemarks{
//                    let coordinates = placemarks.first?.location
//                    let rCoordinates = Locations(cLocation: coordinates!)
//                    var locations = ["location" : rCoordinates]
//                    NC.post(name: Notification.Name(rawValue: "location"), object: nil, userInfo: locations as! [AnyHashable : Any])
//                    return rCoordinates
//                }else{
//                    print("no valid coordinate")
//                }
//            }
//        } -> Locations)
//    }
}
