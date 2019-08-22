//
//  Photo.swift
//  PhotoCollection
//
//  Created by Alex Rhodes on 8/20/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import Foundation
import UIKit

struct Photo: Equatable {
    var name: String
    var photo: UIImage?
    
    init(name: String, photo: UIImage) {
        self.name = name
        self.photo = photo
    }
}
