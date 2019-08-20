//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Alex Rhodes on 8/20/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    var photoController = PhotoController()
    
    var themePreference: ThemePreference?
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.clearsSelectionOnViewWillAppear = false

    }
    
    func setViews() {
        
        if themePreference?.lightTheme == true {
            // Light theme setup
        } else {
            // Dark Theme Setup
        }
    }

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoSegue" {
            guard let addPhotoVC = segue.destination as? AddPhotoViewController else {return}
            addPhotoVC.photoController = photoController
            addPhotoVC.collectionView = collectionView
        }
        if segue.identifier == "ThemeSettingsSegue" {
            guard let themeSettingsVC = segue.destination as? ThemePreferenceViewController else {return}
            themeSettingsVC.themePreference = themePreference
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell else {return UICollectionViewCell()}
    
        cell.photo = photoController.photos[indexPath.row]
        
        return cell
    }
}
