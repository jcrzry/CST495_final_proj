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
struct PlayerData {
    let id: String!
    let image: UIImage?
    let imageId: String
    let firstName: String
    let lastName: String
    let displayName: String
    let from: String
    let to: String
    let reportIds: [String]
}


let demoPlayer1 = PlayerData(
    id: "D1",
    image: nil,
    imageId: "I1",
    firstName: "John",
    lastName: "Doe",
    displayName: "John Doe",
    from: "To: San Francisco",
    to: "TO: San Diego",
    reportIds: ["R1", "R2"]
)

let demoPlayer2 = PlayerData(
    id: "D2",
    image: nil,
    imageId: "I2",
    firstName: "Jane",
    lastName: "Doe",
    displayName: "Alfonso Torres",
    from: "TO: San Diego",
    to: "TO: San Diego",
    reportIds: ["R3"]
)

var demoPlayers = [demoPlayer1, demoPlayer2]

func search(name: String) -> PlayerData? {
    for player in demoPlayers {
        if name == player.firstName || name == player.lastName {
            return player
        }
    }
    return nil
}
