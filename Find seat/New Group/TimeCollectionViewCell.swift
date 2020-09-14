//
//  TimeCollectionViewCell.swift
//  Find seat
//
//  Created by MR9U2 on 7/8/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import UIKit

class TimeCollectionViewCell: UICollectionViewCell {
    class var reuseIdentifier:String{
        return "TimeCollectionViewCell"
    }
    class var nibName:String{
        return "TimeCollectionViewCell"
    }
    @IBOutlet weak var BtnTime: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        BtnTime.layer.borderWidth = 1
        BtnTime.layer.cornerRadius = 0.5
        BtnTime.layer.borderColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00).cgColor
    }
    func configureCell(time:String,textColor:UIColor){
        self.BtnTime.setTitle(time, for: UIControl.State.normal)
        self.BtnTime.setTitleColor(textColor, for: UIControl.State.normal)
    }
    @IBAction func EventBtn(_ sender: Any) {
        self.BtnTime.setTitleColor(UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00), for: .normal)
        self.BtnTime.backgroundColor = UIColor(red: 0.18, green: 0.77, blue: 0.57, alpha: 1.00)
    }
    
}
