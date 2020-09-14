//
//  PlayEntity.swift
//  Find seat
//
//  Created by MR9U2 on 7/6/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import Foundation
import UIKit
class PlayEntity{
    var image : UIImage?
    var conten:String
    var name: String
    init(image:UIImage?,conten:String,name:String) {
        self.image = image
        self.conten = conten
        self.name = name
    }
}
