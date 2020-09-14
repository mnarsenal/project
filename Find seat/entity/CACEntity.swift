//
//  CACEntity.swift
//  Find seat
//
//  Created by MR9U2 on 7/8/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import Foundation
import UIKit
class  CACEntity {
    var imageCAC:UIImage?
    var lblCAC:String
    init(image:UIImage?,name:String) {
        self.imageCAC = image
        self.lblCAC = name
    }
}
