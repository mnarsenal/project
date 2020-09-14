//
//  MainScreenVC.swift
//  Find seat
//
//  Created by MR9U2 on 6/25/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import UIKit
import MapKit
class MainScreenVC: UIViewController, UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    
    @IBOutlet weak var categoroyCollectionView: UICollectionView!
    @IBOutlet weak var playerCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewEvent: UICollectionView!
    @IBOutlet weak var collectionViewRecomand: UICollectionView!
    @IBOutlet weak var collectionViewCategory: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var viewSV: UIView!
    
    @IBOutlet weak var advertisementSV: UIScrollView!
    @IBOutlet weak var mapKitView: MKMapView!
    
    var listCategories: [CategoroyEntity] = []
    var listComments: [CommentEntity] = []
    var listEvent: [EventEntity] = []
    var listPlay: [PlayEntity] = []
    let locationManager = CLLocationManager()
    struct City {
        var name: String
        var lattitude: CLLocationDegrees
        var longtitude: CLLocationDegrees
    }
    let city = [City(name: "Ba Dinh", lattitude: 21.033781, longtitude: 105.814054),
                City(name: "Cau Giay", lattitude: 21.036237, longtitude: 105.790583)]
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        self.advertisementSV.frame = CGRect(x:0, y:0, width:viewSV.frame.width, height:viewSV.frame.height)
        let scrollViewWidth:CGFloat = self.advertisementSV.frame.width
        let scrollViewHeight:CGFloat = self.advertisementSV.frame.height
        // Do any additional setup after loading the view.
        let imgOne = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgOne.image = UIImage(named: "Group 287")
        let imgTwo = UIImageView(frame: CGRect(x:scrollViewWidth, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgTwo.image = UIImage(named: "5")
        let imgThree = UIImageView(frame: CGRect(x:scrollViewWidth*2, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgThree.image = UIImage(named: "6")
        self.advertisementSV.addSubview(imgOne)
        self.advertisementSV.addSubview(imgTwo)
        self.advertisementSV.addSubview(imgThree)
        self.advertisementSV.contentSize = CGSize(width:self.advertisementSV.frame.width * 3 , height:self.advertisementSV.frame.height)
        self.advertisementSV.delegate = self
        self.pageControl.currentPage = 0
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
        checkLocationServices()
        fetchStadiumsOnMap(city)
        
        // register Cell
        let nib = UINib(nibName: PlayCollectionViewCell.nibName, bundle: nil)
        playerCollectionView.register(nib, forCellWithReuseIdentifier: PlayCollectionViewCell.reuseIdentifier)
        let nib1 = UINib(nibName: CategoroyCollectionViewCell.nibName, bundle: nil)
        categoroyCollectionView.register(nib1, forCellWithReuseIdentifier: CategoroyCollectionViewCell.reuseIdentifier)
        collectionViewEvent.register(nib, forCellWithReuseIdentifier: PlayCollectionViewCell.reuseIdentifier)
    }
    
    func initData() {
        listCategories.append(CategoroyEntity(image: UIImage(named: "Group 289"), name: "Moves"))
        listCategories.append(CategoroyEntity(image: UIImage(named: "Group 290"), name: "Events"))
        listCategories.append(CategoroyEntity(image: UIImage(named: "Group 291"), name: "Plays"))
        listCategories.append(CategoroyEntity(image: UIImage(named: "running"), name: "Sports"))
        listCategories.append(CategoroyEntity(image: UIImage(named: "flag"), name: "Activity"))
        listCategories.append(CategoroyEntity(image: UIImage(named: "Group 308"), name: "Monum"))
        listComments.append(CommentEntity(image: UIImage(named: "1") , conten: "Bigil", name: "84%"))
        listComments.append(CommentEntity(image: UIImage(named: "2") , conten: "Kaithi", name: "98%"))
        listComments.append(CommentEntity(image: UIImage(named: "3") , conten: "Asuran", name: "94%"))
        listComments.append(CommentEntity(image: UIImage(named: "4") , conten: "Sarkar", name: "87%"))
        listEvent.append(EventEntity(image: UIImage(named: "10"), conten: "Happy Halloween 2K19", name: "Comedy show"))
        listEvent.append(EventEntity(image: UIImage(named: "11"), conten: "Music DJ king monger Sert...", name: "Comedy show"))
        listEvent.append(EventEntity(image: UIImage(named: "12"), conten: "Summer sounds festiva..", name: "Comedy show"))
        listEvent.append(EventEntity(image: UIImage(named: "13"), conten: "Happy Halloween 2K19", name: "Comedy show"))
        listPlay.append(PlayEntity(image: UIImage(named: "14"), conten: "Alex in wonderland", name: "Comedy show"))
        listPlay.append(PlayEntity(image: UIImage(named: "15"), conten: "Marry poppins puffet show", name: "Music show"))
        listPlay.append(PlayEntity(image: UIImage(named: "16"), conten: "Patrimandram special dewali", name: "Dibet show"))
        listPlay.append(PlayEntity(image: UIImage(named: "17"), conten: "Happy Halloween 2K19", name: "Music show"))
    }
    
    @objc func moveToNextPage (){
        
        let pageWidth:CGFloat = self.advertisementSV.frame.width
        let maxWidth:CGFloat = pageWidth * 3
        let contentOffset:CGFloat = self.advertisementSV.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        var current1Page: Int = Int(contentOffset/pageWidth)+1
        self.pageControl.currentPage = current1Page
        if current1Page == 3 {
            current1Page = 0
            self.pageControl.currentPage = current1Page
        }
        if  contentOffset + pageWidth == maxWidth
        {
            slideToX = 0
        }
        self.advertisementSV.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.advertisementSV.frame.height), animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewCategory {
            return listCategories.count;
        }else if collectionView == self.collectionViewRecomand{
            return listComments.count;
        }
        else {
            return listEvent.count;
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewCategory {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoroyCollectionViewCell", for: indexPath) as! CategoroyCollectionViewCell
            cell.configureCell(img: listCategories[indexPath.row].image, name: listCategories[indexPath.row].nameCategory)
            return cell
        }else if collectionView == collectionViewRecomand{
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "view2CollectionViewCell", for: indexPath) as! view2CollectionViewCell
            cell1.imageView2.image = listComments[indexPath.row].image
            cell1.lbView2.text = listComments[indexPath.row].contenComment
            cell1.lb1View2.text = listComments[indexPath.row].nameComment
            return cell1
        }
        else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: PlayCollectionViewCell.reuseIdentifier, for: indexPath) as! PlayCollectionViewCell
            if collectionView == playerCollectionView {
                cell2.configureCell(player: listPlay[indexPath.row].name, content: listPlay[indexPath.row].conten, image: listPlay[indexPath.row].image )
            }else {
                cell2.configureCell(player: listEvent[indexPath.row].name, content: listEvent[indexPath.row].conten, image: listEvent[indexPath.row].image )
            }
            
            return cell2
        }
        
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
        }
    }
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapKitView.showsUserLocation = true
        case .denied: // Show alert telling users how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            mapKitView.showsUserLocation = true
        case .restricted: // Show an alert letting them know what’s up
            break
        case .authorizedAlways:
            break
        @unknown default:
            fatalError()
        }
    }
    func fetchStadiumsOnMap(_ citys: [City]) {
        for city in citys {
            let annotations = MKPointAnnotation()
            annotations.title = city.name
            annotations.coordinate = CLLocationCoordinate2D(latitude:
                city.lattitude, longitude: city.longtitude)
            mapKitView.addAnnotation(annotations)
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
