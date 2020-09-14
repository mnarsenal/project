//
//  ShowingCollectionViewCell.swift
//  Find seat
//
//  Created by MR9U2 on 7/2/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import UIKit

class ShowingCollectionViewCell: UICollectionViewCell {
    class var reuseIdentifier: String {
        return "ShowingCollectionViewCell"
    }
    class var nibName: String {
        return "ShowingCollectionViewCell"
    }
    @IBOutlet weak var LblShowing: UILabel!
    @IBOutlet weak var ContenShowing: UILabel!
    @IBOutlet weak var ImgShowing: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(img: UIImage?,conten: String,Lbl: String){
        self.ImgShowing.image = img
        self.ContenShowing.text = conten
        self.LblShowing.text = Lbl
        
    }
}
