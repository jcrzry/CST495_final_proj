//
//  demoData.swift
//  Ridealong
//
//  Created by Jonas Deichelmann on 16.11.17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import UIKit
import TB

// MARK: - Data structure -
struct driverData {
    let id: String!
    let image: UIImage?
    let imageId: String
    let firstName: String
    let lastName: String
    let displayName: String
    let from: String
    let to: String
    let notes: String
}


let demoPlayer1 = driverData(
    id: "D1",
    image: nil,
    imageId: "I1",
    firstName: "Ryan",
    lastName: "Cruz",
    displayName: "Ryan Cruz",
    from: "From: CSUMB",
    to: "TO: Monterey",
    notes: "Hey, I want to hear cool music during the ride"
)

let demoPlayer2 = driverData(
    id: "D2",
    image: nil,
    imageId: "I2",
    firstName: "Alfonso",
    lastName: "Torres",
    displayName: "Alfonso Torres",
    from: "From: CSUMB",
    to: "TO: San Francisco",
    notes: "Hey, I want to meet new cool people"
)

var demoPlayers = [demoPlayer1, demoPlayer2]

func search(name: String) -> driverData? {
    for player in demoPlayers {
        if name == player.firstName || name == player.lastName {
            return player
        }
    }
    return nil
}
