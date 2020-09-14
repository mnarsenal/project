//
//  PlayCollectionViewCell.swift
//  Find seat
//
//  Created by MR9U2 on 7/1/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import UIKit

class PlayCollectionViewCell: UICollectionViewCell {
    
    class var reuseIdentifier: String {
        return "PlayCollectionViewCell"
    }
    class var nibName: String {
        return "PlayCollectionViewCell"
    }
    
    @IBOutlet weak var LblPlayView: UILabel!
    @IBOutlet weak var contenPlayView: UILabel!
    @IBOutlet weak var ImgPlayView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureCell(player: String,content:String, image:UIImage?) {
        self.LblPlayView.text = player
        self.contenPlayView.text = content
        self.ImgPlayView.image = image
    }
    
}
