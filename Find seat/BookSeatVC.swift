//
//  BookSeatVC.swift
//  Find seat
//
//  Created by MR9U2 on 7/7/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import UIKit
import AVFoundation
class BookSeatVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var btnVideoPlay: UIButton!
    @IBOutlet weak var cACCollectionViewCell: UICollectionView!
    @IBOutlet weak var yourOffersCollectionViewCell: UICollectionView!
    @IBOutlet weak var ViewVideo: UIView!
    var imageArroy = [UIImage(named: "Group 358"),UIImage(named: "Group 358v2")]
    var background = [UIColor(red: 0.99, green: 0.79, blue: 0.78, alpha: 1.00),UIColor(red: 0.54, green: 0.85, blue: 0.50, alpha: 1.00)]
    var listCAC: [CACEntity] = []
    var player:AVPlayer?
    var isPlaying = false
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        PlayVideo()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: YourOffersCollectionViewCell.nibName, bundle: nil)
        yourOffersCollectionViewCell.register(nib, forCellWithReuseIdentifier: YourOffersCollectionViewCell.reuseIdentifier)
        let nib1 = UINib(nibName: CACCollectionViewCell.nibname, bundle: nil)
        cACCollectionViewCell.register(nib1, forCellWithReuseIdentifier: CACCollectionViewCell.reuseIdentifier)
        
    }
    func initData(){
        listCAC.append(CACEntity(image: UIImage(named: "22"), name: "chadwick"))
        listCAC.append(CACEntity(image: UIImage(named: "23"), name: "Letitia Wright"))
        listCAC.append(CACEntity(image: UIImage(named: "24"), name: "B. Jordan"))
        listCAC.append(CACEntity(image: UIImage(named: "25"), name: "Lupita Nyong"))
    }
    
    func PlayVideo(){
        guard let path = Bundle.main.path(forResource: "video_demo", ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        player.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none;
        let playlayer = AVPlayerLayer(player: player)
        playlayer.frame = CGRect(x: 0, y: 0, width: ViewVideo.frame.width, height: ViewVideo.frame.height)
        playlayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        //self.layer.insertSublayer(playlayer, at: 0)
        player.seek(to: CMTime.zero)
        self.ViewVideo.layer.addSublayer(playlayer)
        player.play()
    }
    @IBAction func BtnVideo(_ sender: Any) {
        if player?.isPlaying ?? false {
            initPlayer()
        }else {
            stopPlayer()
        }
    }
    
    func initPlayer(){
        if let play = player{
            play.play()
        }
        else{
            guard let path = Bundle.main.path(forResource: "video_demo", ofType:"mp4") else {
                debugPrint("video.m4v not found")
                return
            }
            player = AVPlayer(url: URL(fileURLWithPath: path))
            player?.play()
        }
    }
    func stopPlayer(){
        if let play = player{
            play.pause()
        }
       
    }
        
        
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.yourOffersCollectionViewCell{
            return imageArroy.count
        }
        else{
            return listCAC.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == yourOffersCollectionViewCell{
            let cell = yourOffersCollectionViewCell.dequeueReusableCell(withReuseIdentifier: "YourOffersCollectionViewCell", for: indexPath) as! YourOffersCollectionViewCell
            cell.configureCell(image: imageArroy[indexPath.row], background: background[indexPath.row])
            return cell
        }
        else{
            let cell = cACCollectionViewCell.dequeueReusableCell(withReuseIdentifier: "CACCollectionViewCell", for: indexPath) as! CACCollectionViewCell
            cell.configureCell(image: listCAC[indexPath.row].imageCAC, name: listCAC[indexPath.row].lblCAC)
            return cell
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

extension AVPlayer {

    var isPlaying: Bool {
        if (self.rate != 0 && self.error == nil) {
            return true
        } else {
            return false
        }
    }

}
