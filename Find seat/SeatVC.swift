//
//  SeatVC.swift
//  Find seat
//
//  Created by MR9U2 on 7/8/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import UIKit

class SeatVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet var viewScreen: UIView!
    @IBOutlet weak var leadingINOX: NSLayoutConstraint!
    @IBOutlet weak var bottomINOX: NSLayoutConstraint!
    @IBOutlet weak var tralingINOX: NSLayoutConstraint!
    @IBOutlet weak var heightINOX: NSLayoutConstraint!
    @IBOutlet weak var iNOXview: UIView!
    var TextColor = [UIColor(red: 0.18, green: 0.77, blue: 0.57, alpha: 1.00),UIColor(red: 0.92, green: 0.55, blue: 0.18, alpha: 1.00),UIColor(red: 0.18, green: 0.77, blue: 0.57, alpha: 1.00),UIColor(red: 0.92, green: 0.55, blue: 0.18, alpha: 1.00),UIColor(red: 0.18, green: 0.77, blue: 0.57, alpha: 1.00)]
    var TitleBtn = ["10:00 AM","1:30 PM","6:30 PM","9:30 PM","12:30 AM"]
    var TitleMailBtn = ["10:00 AM","1:30 PM","6:30 PM"]
    var TextMailColor = [UIColor(red: 0.18, green: 0.77, blue: 0.57, alpha: 1.00),UIColor(red: 0.92, green: 0.55, blue: 0.18, alpha: 1.00),UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)]
    var TitleAtoms = ["10:00 AM","1:30 PM"]
    var TextAtomsColor = [UIColor(red: 0.18, green: 0.77, blue: 0.57, alpha: 1.00),UIColor(red: 0.92, green: 0.55, blue: 0.18, alpha: 1.00)]
    var TextColorKC = [UIColor(red: 0.18, green: 0.77, blue: 0.57, alpha: 1.00),UIColor(red: 0.92, green: 0.55, blue: 0.18, alpha: 1.00),UIColor(red: 0.18, green: 0.77, blue: 0.57, alpha: 1.00),UIColor(red: 0.18, green: 0.77, blue: 0.57, alpha: 1.00)]
    var TitleBtnKC = ["10:00 AM","1:30 PM","6:30 PM","9:30 PM"]
    @IBOutlet weak var atomsCVC: UICollectionView!
    @IBOutlet weak var KGCVC: UICollectionView!
    @IBOutlet weak var timeCollectionViewCell: UICollectionView!
    @IBOutlet weak var timeMailCVC: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: TimeCollectionViewCell.nibName, bundle: nil)
        timeCollectionViewCell.register(nib, forCellWithReuseIdentifier: TimeCollectionViewCell.reuseIdentifier)
        timeMailCVC.register(nib, forCellWithReuseIdentifier: TimeCollectionViewCell.reuseIdentifier)
        atomsCVC.register(nib, forCellWithReuseIdentifier: TimeCollectionViewCell.reuseIdentifier)
        KGCVC.register(nib, forCellWithReuseIdentifier: TimeCollectionViewCell.reuseIdentifier)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == timeCollectionViewCell{
        return TitleBtn.count
    }
        else if collectionView == timeMailCVC{
            return TitleMailBtn.count
        }
        else if collectionView == atomsCVC {
            return TitleAtoms.count
        }
        else{
            return TitleBtnKC.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == timeCollectionViewCell{
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCollectionViewCell.reuseIdentifier, for: indexPath) as! TimeCollectionViewCell
        cell.configureCell(time: TitleBtn[indexPath.row], textColor: TextColor[indexPath.row])
            return cell
        }
        else if collectionView == timeMailCVC{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCollectionViewCell.reuseIdentifier, for: indexPath) as! TimeCollectionViewCell
            cell.configureCell(time: TitleMailBtn[indexPath.row], textColor: TextMailColor[indexPath.row])
                return cell
        }
        else if collectionView == atomsCVC{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCollectionViewCell.reuseIdentifier, for: indexPath) as! TimeCollectionViewCell
            cell.configureCell(time: TitleAtoms[indexPath.row], textColor: TextAtomsColor[indexPath.row])
                return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCollectionViewCell.reuseIdentifier, for: indexPath) as! TimeCollectionViewCell
                cell.configureCell(time: TitleBtnKC[indexPath.row], textColor: TextColorKC[indexPath.row])
                    return cell
            }
        }
    @IBAction func btbBT(_ sender: Any) {
        viewScreen.backgroundColor = UIColor(white: 2, alpha: 0.5)
        self.view.addSubview(iNOXview)
        self.heightINOX.isActive = true
        self.tralingINOX.isActive = true
        self.leadingINOX.isActive = true
        self.bottomINOX.isActive = true
        
       
    }
}



