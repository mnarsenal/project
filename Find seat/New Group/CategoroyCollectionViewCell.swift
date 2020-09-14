//
//  CategoroyCollectionViewCell.swift
//  Find seat
//
//  Created by MR9U2 on 7/7/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import UIKit

class CategoroyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    class var reuseIdentifier: String{
        return "CategoroyCollectionViewCell"
    }
    class var nibName: String{
        return "CategoroyCollectionViewCell"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(img:UIImage?,name:String){
        self.image.image = img
        self.name.text = name
    }
    @IBAction func BtnMoves(_ sender: Any) {
        
    }
}
