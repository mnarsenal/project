//
//  CategoroyEntity.swift
//  Find seat
//
//  Created by MR9U2 on 7/5/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import Foundation
import UIKit

class CategoroyEntity {
    var image: UIImage?
    var nameCategory: String
    
    init(image: UIImage?, name: String) {
        self.image = image
        self.nameCategory = name
    }
}
