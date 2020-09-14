//
//  H1.swift
//  Find seat
//
//  Created by MR9U2 on 8/1/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import UIKit

class H1: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
   
    @IBOutlet weak var xcView: XcView!
    
    @IBOutlet weak var h2: UICollectionView!
    @IBOutlet weak var h1: UICollectionView!
    var TitleMailBtn = ["10:00 AM","1:30 PM","6:30 PM"]
    @IBOutlet weak var Btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var Btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn10: UIButton!
    
    var TextMailColor = [UIColor(red: 0.18, green: 0.77, blue: 0.57, alpha: 1.00),UIColor(red: 0.92, green: 0.55, blue: 0.18, alpha: 1.00),UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)]
    var backgroundButton = UIColor(red: 0.18, green: 0.77, blue: 0.57, alpha: 1.00)
    var backgroundButtonDefaul = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
    var listBooksVehicle: [BooksVehicleEntity] = []
    var text1 = ["King,Queen,Jack"]
    var text2 = ["$ 120.00,$ 100.00,$ 80.00"]
    var text3 = ["Filling fast,Available"]
    var selectedIndexPath: IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: TimeCollectionViewCell.nibName, bundle: nil)
        h1.register(nib, forCellWithReuseIdentifier: TimeCollectionViewCell.reuseIdentifier)
        let nib1 = UINib(nibName: BooksVehicle.nibName, bundle: nil)
        h2.register(nib1, forCellWithReuseIdentifier: BooksVehicle.reuseIdentifier)
     
        initdata()
        // Do any additional setup after loading the view.
    }
    func initdata(){
        listBooksVehicle.append(BooksVehicleEntity(lb1: "King", lb2: "$ 120.00", lb3: "Filling fast"))
        listBooksVehicle.append(BooksVehicleEntity(lb1: "Queen", lb2: "$ 100.00", lb3: "Available"))
        listBooksVehicle.append(BooksVehicleEntity(lb1: "Jack", lb2: "$ 80.00", lb3: "Available"))
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.h1{
            return TitleMailBtn.count
        }
        else {
            return listBooksVehicle.count
        }
        
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.h1{
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCollectionViewCell.reuseIdentifier, for: indexPath) as! TimeCollectionViewCell
           cell.configureCell(time: TitleMailBtn[indexPath.row], textColor: TextMailColor[indexPath.row])
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BooksVehicle.reuseIdentifier, for: indexPath) as! BooksVehicle
            cell.configure(Lb1: listBooksVehicle[indexPath.row].Lb11, Lb2: listBooksVehicle[indexPath.row].Lb21, Lb3: listBooksVehicle[indexPath.row].Lb31)
             return cell
        }
        
       }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! BooksVehicle
        cell.configuButton(click: backgroundButton)
        
        self.selectedIndexPath = indexPath
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! BooksVehicle
        cell.configuButton(click: backgroundButtonDefaul)
        

        self.selectedIndexPath = nil
    }
    func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        let cell = collectionView.cellForItem(at: indexPath as IndexPath) as! BooksVehicle
        xcView.ImgView.image = UIImage(named: "Group 492.1")
    }
    @IBAction func btn1Action(_ sender: Any) {
        self.Btn1.setTitleColor(UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00), for: .normal)
        self.Btn1.backgroundColor = UIColor(red: 0.18, green: 0.77, blue: 0.57, alpha: 1.00)
        self.btn2.setTitleColor(UIColor(red: 0.40, green: 0.40, blue: 0.40, alpha: 1.00), for: .normal)
        self.btn2.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        xcView.ImgView.image = UIImage(named: "Group 492")
    }
    
    @IBAction func btn2Action(_ sender: Any) {
        self.btn2.setTitleColor(UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00), for: .normal)
        self.btn2.backgroundColor = UIColor(red: 0.18, green: 0.77, blue: 0.57, alpha: 1.00)
        self.Btn1.setTitleColor(UIColor(red: 0.40, green: 0.40, blue: 0.40, alpha: 1.00), for: .normal)
        self.Btn1.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        xcView.ImgView.image = UIImage(named: "Group 492.1")
    }
    @IBAction func btn3Action(_ sender: Any) {
    }
    @IBAction func btn4Action(_ sender: Any) {
    }
    @IBAction func btn5(_ sender: Any) {
    }
    @IBAction func btn6Action(_ sender: Any) {
    }
    @IBAction func btn7Action(_ sender: Any) {
    }
    @IBAction func btn8Action(_ sender: Any) {
    }
    @IBAction func btn9Action(_ sender: Any) {
    }
    @IBAction func btn10Action(_ sender: Any) {
    }
}
