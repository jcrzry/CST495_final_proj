//
//  Rating.swift
//  Ridealong
//
//  Created by SImon Nielsen on 28/09/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
struct Rating{
    
    var rating : Int
    var description : String?
    var averageRating : Int
    
    //RATING FUNCTIONS
    
    /*
     1. We would want to allow users to give others users a rating 2 hours after an accepted ride.
     2. We want to present the rating with pictures of stars.
     3. We want to store it in Realm and present an average rating at the users dashboard.
     4. We want to withhold the rating information and option of rating back for the rated user A until user A has rated back.
     */
    
    
    func authorizeUserToRate(){
        
    }
    func createUserRating() -> Rating{
       
    }
    func presentAverageRating(){
        
    }
    
    
    
}
