//
//  BooksVehicle.swift
//  Find seat
//
//  Created by MR9U2 on 8/3/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import UIKit

class BooksVehicle: UICollectionViewCell {

    class var reuseIdentifier:String{
        return "BooksVehicle"
    }
    class var nibName:String{
        return "BooksVehicle"
    }
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var text3: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(Lb1:String,Lb2:String,Lb3:String){
        self.text1.text = Lb1
        self.text2.text = Lb2
        self.text3.text = Lb3
    }
    func configuButton(click:UIColor){
        self.backgroundColor = click
        
    }
}
