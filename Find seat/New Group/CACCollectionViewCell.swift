//
//  CACCollectionViewCell.swift
//  Find seat
//
//  Created by MR9U2 on 7/8/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import UIKit

class CACCollectionViewCell: UICollectionViewCell {
    class var reuseIdentifier:String{
        return "CACCollectionViewCell"
    }
    class var nibname:String{
        return "CACCollectionViewCell"
    }
    @IBOutlet weak var LblCAC: UILabel!
    @IBOutlet weak var imageCAC: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(image:UIImage?,name:String){
        self.imageCAC.image = image
        self.LblCAC.text = name
    }
}
