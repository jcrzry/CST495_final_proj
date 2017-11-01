//
//  UiViewControllerEX.swift
//  TB
//
//  Created by Jonas Deichelmann on 28.09.17.
//  Copyright © 2017 JonasDeichelmann. All rights reserved.
//

import Foundation


public extension UIViewController {

    //- MARK: hideKeyboardWhenTappedAround
<<<<<<< HEAD
=======

>>>>>>> dfc2eac953ebec87d60a3ec8ece5583051bdd9fd
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
