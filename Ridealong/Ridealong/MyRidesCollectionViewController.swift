//
//  MyRidesCollectionViewController.swift
//  Ridealong
//
//  Created by Simon M. Nielsen on 12/19/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//
import TB
import UIKit

private let reuseIdentifier = "MyRidesCell"
private let inset: CGFloat = 2
private let cellHeight: CGFloat = 60
private let cellLineSpacing: CGFloat = 0
private let myRides = getDemoArrayData()
private let unratedRides = getDemoArrayData()
private let ratedRides = getDemoArrayData()

class MyRidesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate, MyRidesCellDelegate {
    
 
    //MARK: Data
    func fetchObjects(){
    //    var items = [Ride]()
    //    let realm = try! Realm()
    //    items = (realm.objects(Ride.self))
    }
    
    
    //MARK: View functions
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView!.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       collectionView!.reloadData()
    }
    
    override func viewDidLoad() {
        fetchObjects()
        super.viewDidLoad()
        collectionView!.register(UINib(nibName: "MyRidesCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        collectionView!.delegate = self
       
        //Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
         }
    
    // MARK: Sections
   override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    //TODO: Section titles
 //   override func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
   //     switch section {
     //   case 0: return "My rides"
       // case 1: return "Unrated rides"
      //  case 2: return "Past rides"
      //  default: return ""
       // }
   // }
    
    //MARK: collectionView functions
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
  //      switch section {
  //      case 0: return myRides.count
  //      case 1: return unratedRides.count
  //      case 2: return ratedRides.count
  //      default: return 0
  //      }
        
        return myRides.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyRidesCell
            cell.driverName.text = "Test"
       //     cell.setData(driver: demoDrivers[indexPath.row])
        
        return cell
        }
   
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        //Rating functionality goes here
        
        let newViewController = RatingViewController()
      //  newViewController.setData(ride: demoRides[indexPath.row])
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

    
    
        // MARK: UICollectionViewFlowLayout
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width - (2 * inset), height: cellHeight)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return cellLineSpacing
        }
    
   
        // MARK: Segue
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        }
    
        // MARK: Delegate functions
        func provideRating() {
        
        // Rating code goes here
        // Get and set rating objects from Realm
        }
    
    
        func addTapped(){
            TB.info("add tapped")
            let newViewController = AddRideViewController()
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
}



