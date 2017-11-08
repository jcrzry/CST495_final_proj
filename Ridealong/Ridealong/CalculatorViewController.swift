//
//  CalculatorViewController.swift
//  Ridealong
//
//  Created by Jonas Deichelmann on 15.10.17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import UIKit
import TB
import MapKit
import CoreLocation

class CalculatorViewController: UITableViewController, CLLocationManagerDelegate {

    // - MARK: Defining Var
    @IBOutlet weak var gasStationName: UILabel!
    @IBOutlet weak var gasStationLocation: UILabel!

    @IBOutlet weak var costDiesel: UILabel!
    @IBOutlet weak var costSuperE10: UILabel!
    @IBOutlet weak var costSuper: UILabel!
    @IBOutlet weak var averageLiter: UITextField!
    @IBOutlet weak var averageMilliliter: UITextField!
    var averageGas = 0.0
    @IBOutlet weak var neededKilometer: UITextField!
    @IBOutlet weak var neededCosts: UILabel!
    @IBOutlet weak var neededGas: UILabel!
    @IBOutlet weak var inputCost: UITextField!
    var  gasCost = 0.0
    //    var nextStation = GasStation()

    var locationManager = CLLocationManager()
    var currentLocation: CLLocation!

    // - MARK: viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        initCommonRealm()
        hideKeyboardWhenTappedAround()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestWhenInUseAuthorization()

        navigationController?.navigationBar.topItem?.title = "Caluclator!"

//        updateGasstation()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    @IBAction func calculate(_ sender: Any) {
        if gasCost == 0.0 {
            let alert = UIAlertController(title: "Please Choose Gas", message: "Please choose a Gas for calculation.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            averageGas = Double("\(String(describing: averageLiter.text!))"+"."+"\(String(describing: averageMilliliter.text!))")!
            neededGas.text = String(Double(neededKilometer.text!)! / 100 * Double(averageGas))
            neededCosts.text = String(Double(neededGas.text!)!*gasCost)
        }
    }

    // - MARK: Table View Function

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section == 0{
            return nil
        }
        if indexPath.section == 1{
            if let cell = tableView.cellForRow(at: indexPath) {
                gasCost = Double(cell.detailTextLabel?.text! ?? "0.0")!
            }
            if indexPath.row == 3{
                if inputCost.text == "" {
                    gasCost = 0.0
                }else{
                    gasCost = Double(inputCost.text!)!
                }
            }
            return indexPath
        }
        if indexPath.section == 2{
            return nil
        }
        return nil
    }

    // - MARK: locationManager Function

//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        switch status {
//        case .notDetermined:
//            TB.info("If status has not yet been determied, ask for authorization")
//            locationManager.requestWhenInUseAuthorization()
//            break
//        case .authorizedWhenInUse:
//            TB.info("If authorized when in use")
//            locationManager.startUpdatingLocation()
//            let loc = locationManager.location
//            let lat = (loc?.coordinate.latitude)!
//            let long = (loc?.coordinate.longitude)!
//            UserCoordinates.shared.coordinateLat = lat
//            UserCoordinates.shared.coordinateLong = long
//            updateGasstation()
//            break
//        case .authorizedAlways:
//            TB.info("If always authorized")
//
//            updateGasstation()
//            break
//        case .restricted:
//            TB.info("If restricted by e.g. parental controls. User can't enable Location Services")
//            break
//        case .denied:
//            TB.info("If user denied your app access to Location Services, but can grant access from Settings.app")
//            break
//        }
//    }

//    @objc func updateGasstation(){
//        locationManager.startUpdatingLocation()
//        let loc = locationManager.location
//        let lat = (loc?.coordinate.latitude)!
//        let long = (loc?.coordinate.longitude)!
//
//        UserCoordinates.shared.coordinateLat = lat
//        UserCoordinates.shared.coordinateLong = long
//        nextStation = apiCall()
//        TB.info("Data from the Gasstation: \(nextStation)")
//        tankstellenName.text =  nextStation.brand + ": " + nextStation.name
//        tankstellenOrt.text = nextStation.location.place + "," + nextStation.location.street
//        preisSuper.text = String(nextStation.gas.e5)
//        preisDiesel.text = String(nextStation.gas.diesel)
//        preisSuperE10.text = String(nextStation.gas.e10)
//    }
}

