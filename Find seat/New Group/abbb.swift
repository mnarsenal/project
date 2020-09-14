//
//  abbb.swift
//  Find seat
//
//  Created by MR9U2 on 8/11/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import UIKit

class abbb: UICollectionViewCell {
    class var reuseIdentifier:String{
        return "abbb"
    }
    class var nibName:String{
        return "abbb"
    }

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(img:UIImage?,text: String){
        self.img1.image = img
        self.img.text = text
    }
}
