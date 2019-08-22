//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Alex Rhodes on 8/20/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
           setViews()
        }
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoNameLabel: UILabel!
    
    
    func setViews() {
        guard let photo = photo else {return}
        photoImageView.image = photo.photo
        photoNameLabel.text = photo.name
    }
    
}
