//
//  collectionViewController.swift
//  Ridealong
//
//  Created by Jonas Deichelmann on 16.11.17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import TB

private let reuseIdentifier = "FeedCell"

class PlayersCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate, FeedCellDelegate{

    private let inset: CGFloat = 2
    private let cellHeight: CGFloat = 60
    private let cellLineSpacing: CGFloat = 0
    private var longPress: UILongPressGestureRecognizer!
    private var longPressedCell: FeedCell?


    // MARK: - overrides  -
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        collectionView!.register(UINib(nibName: "FeedCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        collectionView!.delegate = self

        longPress = UILongPressGestureRecognizer(target: self, action: #selector(PlayersCollectionViewController.handleLongPress(gesture:)))
        longPress.delegate = self
        collectionView!.addGestureRecognizer(longPress)

//        let savedPlayers = PlayerBO.playersQuery().resultSet()
//        for playerItem in savedPlayers {
//            let playerBO = PlayerBO(item: playerItem)
//            var displayName = ""
//            if let pBO = playerBO {
//                displayName = pBO.firstName + " " + pBO.lastName
//            }
//            let player = PlayerData(
//                id: playerBO?.id,
//                image: playerBO?.image,
//                imageId: playerBO?.imageId ?? "",
//                firstName: playerBO?.firstName ?? "",
//                lastName: playerBO?.lastName ?? "",
//                displayName: displayName,
//                clubName: playerBO?.clubName ?? "",
//                reportIds: playerBO?.reportIds ?? [])
//            demoPlayers.insert(player, at: 0)
//        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView!.reloadData()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        longPressedCell?.unsetDeletion()
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
        return demoPlayers.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCell
        cell.setData(player: demoPlayers[indexPath.row])
        cell.unsetDeletion()
        cell.delegate = self
        return cell
    }


    // MARK: - UICollectionViewDelegate -
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        longPressedCell?.unsetDeletion()
        performSegue(withIdentifier: "showPlayerDetails", sender: indexPath.row)
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
            demoPlayers.remove(at: path.row)
            collectionView!.deleteItems(at: [path])
        }
        longPressedCell = nil
    }


    // MARK: - Set Data -
    func addPlayer(_ player: PlayerData){
        demoPlayers.insert(player, at: 0)
        collectionView!.reloadData()
    }
}

