//
//  YourOffersCollectionViewCell.swift
//  Find seat
//
//  Created by MR9U2 on 7/7/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import UIKit

class YourOffersCollectionViewCell: UICollectionViewCell {
    class var reuseIdentifier:String{
        return "YourOffersCollectionViewCell"
    }
    class var nibName:String{
        return "YourOffersCollectionViewCell"
    }
    @IBOutlet weak var imageYOff: UIImageView!
    @IBOutlet weak var ViewYOff: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(image:UIImage?,background:UIColor){
        self.imageYOff.image = image
        self.ViewYOff.backgroundColor = background
        
    }
}
