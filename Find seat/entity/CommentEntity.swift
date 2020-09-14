//
//  File.swift
//  Find seat
//
//  Created by MR9U2 on 7/6/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import Foundation
import UIKit
class CommentEntity {
    var image : UIImage?
    var contenComment: String
    var nameComment: String
    
    init(image: UIImage?,conten: String,name:String) {
        self.image = image
        self.contenComment = conten
        self.nameComment = conten
    }
}
