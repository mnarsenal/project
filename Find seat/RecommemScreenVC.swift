//
//  RecommemScreenVC.swift
//  Find seat
//
//  Created by MR9U2 on 7/2/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import UIKit

class RecommemScreenVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    

    @IBOutlet weak var ShowingCollectionView: UICollectionView!
    
    @IBOutlet weak var BtnShowing: UIButton!
    @IBOutlet weak var BtnComing: UIButton!
    @IBOutlet weak var BtnExclusive: UIButton!
    @IBOutlet weak var LblShowing: UILabel!
    @IBOutlet weak var LblComing: UILabel!
    @IBOutlet weak var LblEx: UILabel!
    @IBOutlet weak var viewShowing: UIView!
    @IBOutlet weak var viewComing: UIView!
    @IBOutlet weak var viewEx: UIView!
    var listConmment: [CommentEntity] = []
    //var image1Arroy = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "20"),UIImage(named: "21"),UIImage(named: "3"),UIImage(named: "4")]
    //var lb0Arroy = ["Bigil","Kaithi","Gabbar","Pizza - part 2","Asuran","Sarkar"]
    //var lb1Arroy = ["84%","98%","84%","98%","84%","98%"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: ShowingCollectionViewCell.nibName, bundle: nil)
        ShowingCollectionView.register(nib, forCellWithReuseIdentifier: ShowingCollectionViewCell.reuseIdentifier)
       initData()
        
        // Do any additional setup after loading the view.
        
    }
    func initData(){
        listConmment.append(CommentEntity(image: UIImage(named: "1"), conten: "Bigil", name: "84%"))
        listConmment.append(CommentEntity(image: UIImage(named: "2"), conten: "Kaithi", name: "98%"))
        listConmment.append(CommentEntity(image: UIImage(named: "20"), conten: "Gabbar", name: "84%"))
        listConmment.append(CommentEntity(image: UIImage(named: "21"), conten: "Pizza - part 2", name: "98%"))
        listConmment.append(CommentEntity(image: UIImage(named: "3"), conten: "Asuran", name: "84%"))
        listConmment.append(CommentEntity(image: UIImage(named: "4"), conten: "Sarkar", name: "98%"))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listConmment.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowingCollectionViewCell.reuseIdentifier, for: indexPath) as! ShowingCollectionViewCell
        cell.configureCell(img: listConmment[indexPath.row].image, conten: listConmment[indexPath.row].contenComment, Lbl: listConmment[indexPath.row].nameComment)
        return cell
    }

 
    @IBAction func AcitonBtnShowing(_ sender: Any) {
        LblShowing.textColor = UIColor(red: 0.91, green: 0.09, blue: 0.40, alpha: 1.00)
        viewShowing.backgroundColor = UIColor(red: 0.91, green: 0.09, blue: 0.40, alpha: 1.00)
    LblComing.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
    viewComing.backgroundColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
        LblEx.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
        viewEx.backgroundColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
        
    }
    
    @IBAction func ActionActionBtnComing(_ sender: Any) {
        LblComing.textColor = UIColor(red: 0.91, green: 0.09, blue: 0.40, alpha: 1.00)
        viewComing.backgroundColor = UIColor(red: 0.91, green: 0.09, blue: 0.40, alpha: 1.00)
        LblEx.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
        viewEx.backgroundColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
        LblShowing.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
        viewShowing.backgroundColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
    }
    @IBAction func ActionBtnEx(_ sender: Any) {
        LblEx.textColor = UIColor(red: 0.91, green: 0.09, blue: 0.40, alpha: 1.00)
        viewEx.backgroundColor = UIColor(red: 0.91, green: 0.09, blue: 0.40, alpha: 1.00)
        LblComing.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
        viewComing.backgroundColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
        LblShowing.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
        viewShowing.backgroundColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
    }
}
