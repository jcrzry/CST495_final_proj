//
//  FeedCollectionViewController.swift
//  Ridealong
//
//  Created by Jonas Deichelmann on 16.11.17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import TB

private let reuseIdentifier = "FeedCell"

class FeedCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate, FeedCellDelegate{

    private let inset: CGFloat = 2
    private let cellHeight: CGFloat = 60
    private let cellLineSpacing: CGFloat = 0
    private var longPress: UILongPressGestureRecognizer!
    private var longPressedCell: FeedCell?

    // MARK: - overrides  -
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView!.register(UINib(nibName: "FeedCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        collectionView!.delegate = self
        longPress = UILongPressGestureRecognizer(target: self, action: #selector(FeedCollectionViewController.handleLongPress(gesture:)))
        longPress.delegate = self
        collectionView!.addGestureRecognizer(longPress)
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [add]

    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView!.reloadData()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        longPressedCell?.unsetDeletion()
    }
    override func viewDidAppear(_ animated: Bool) {
        longPressedCell?.unsetDeletion()
        collectionView!.reloadData()
    }
    // MARK: - UICollectionViewFlowLayout -
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - (2 * inset), height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellLineSpacing
    }
    // MARK: - UICollectionViewDataSource -
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return demoRides.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCell
        cell.setData(driver: demoDrivers[indexPath.row])
        cell.unsetDeletion()
        cell.delegate = self
        return cell
    }
    // MARK: - UICollectionViewDelegate -
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        longPressedCell?.unsetDeletion()
        let newViewController = SeeRideViewController()
        newViewController.setData(ride: demoRides[indexPath.row])
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    // MARK: - navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    // MARK: - Gestures -
    func handleLongPress(gesture: UILongPressGestureRecognizer) {
        guard gesture.state == .began else {
            return
        }
        let point = gesture.location(in: self.collectionView)
        if let indexPath = collectionView!.indexPathForItem(at: point) {
            let cell = (collectionView!.cellForItem(at: indexPath) as! FeedCell)
            if cell.doesProvideDeletion() {
                return // already providing deletion options
            }
            longPressedCell?.unsetDeletion()
            longPressedCell = cell
            longPressedCell!.provideDeletion()
        }
    }
    func removeCellFromList() {
        let indexPath = collectionView!.indexPath(for: longPressedCell!)
        if let path = indexPath {
            demoDrivers.remove(at: path.row)
            collectionView!.deleteItems(at: [path])
        }
        longPressedCell = nil
    }
    // MARK: - Set Data -
    func addRide(_ ride: driverData){
        demoDrivers.insert(ride, at: 0)
        collectionView!.reloadData()
    }
    func addTapped(){
        TB.info("add tapped")
        let newViewController = AddRideViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}

