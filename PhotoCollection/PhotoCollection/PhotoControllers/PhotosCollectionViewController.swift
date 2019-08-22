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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        setViews()
    }
    
    func setViews() {
        
        
        
        let themePreference = UserDefaults.standard.integer(forKey: .selectedSegmentIndex)
        
        guard let themeStyle = Theme(rawValue: themePreference) else { return }
        
        if themeStyle == .light {
            collectionView.backgroundColor = .white
        } else {
            collectionView.backgroundColor = .black
            view.backgroundColor = .black
        }
        
    }
    
    //    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    //        let photo = photoController.photos[indexPath.item]
    //
    //        let questionController = UIAlertController(title: "What u wanna do?", message: nil, preferredStyle: .alert)
    //        questionController.addAction(UIAlertAction(title: "Rename person", style: .default, handler: {
    //
    //            (action:UIAlertAction!) -> Void in
    //
    //            let ac = UIAlertController(title: "Rename person", message: nil, preferredStyle: .alert)
    //            ac.addTextField(configurationHandler: nil)
    //
    //            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    //            ac.addAction(UIAlertAction(title: "OK", style: .default) { [unowned self] _ in
    //
    //
    //                self.collectionView.reloadData() })
    //
    //            self.present(ac, animated: true, completion: nil)
    //
    //        }))
    //
    //        questionController.addAction(UIAlertAction(title: "Delete Person", style: .default, handler: {
    //
    //            (action:UIAlertAction!) -> Void in
    //
    //            self.collectionView.deleteItems(at: [indexPath as IndexPath])
    //            self.collectionView.reloadData()
    //
    //        }))
    //
    //        present(questionController, animated: true, completion: nil)
    //    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoSegue" {
            if let addPhotoVC = segue.destination as? AddPhotoViewController {
                addPhotoVC.photoController = photoController
            }
        } else if segue.identifier == "ThemeSettingsSegue" {
            if let themeSettingsVC = segue.destination as? ThemePreferenceViewController {
                themeSettingsVC.photoController = photoController
            }
        } else if segue.identifier == "PhotoCellDetailSegue" {
            if let detailPhotoVC = segue.destination as? AddPhotoViewController {
                detailPhotoVC.photoController = photoController
                
                guard let indexPath = collectionView.indexPathsForSelectedItems?.first?.item else {return}
                let photo = photoController.photos[indexPath]
                
                detailPhotoVC.photo = photo
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell else {return UICollectionViewCell()}
        
        let photo = photoController.photos[indexPath.row]
        cell.photo = photo
        
        return cell
    }
}
