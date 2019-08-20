//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Alex Rhodes on 8/20/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import Foundation
import UIKit

class PhotoController {
    
    var photos: [Photo] = []
    
    func addPhoto(name: String, image: UIImage) {
        let photo = Photo(name: name, photo: image)
        photos.append(photo)
    }
}
