//
//  CarouselViewController.swift
//  
//
//  Created by Eslam Sebaie on 1/31/20.
//

import UIKit
import FirebaseFirestore
import Firebase
class ResturantVC: UIViewController , resturantView {
    func fetchData(newData: [resturantData]) {
        self.resturantdata = newData
        print(newData)
        collectionView.reloadData()
        iCarouselView.reloadData()
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var resturantName: UILabel!
    @IBOutlet weak var iCarouselView: iCarousel!
    @IBOutlet weak var allPressChanged: UIButton!
    
    
    var sendResturantName = ""
    var nameOfMall: String = ""
    var nameOfCheckCarsoul = ""
    
    
    var nameArr: [String] = []
    var newNameArr: [String] = []
    var imgArr: [String] = []
    var newArr: [String] = []
    

//    var chooseAll = false
    var newIndex = 0
    var checkCarousel = false
    var indx:IndexPath?
   
    
    var resturantdata: [resturantData] = [resturantData()]
     
    var presenter: ResturantPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        presenter = ResturantPresenter(view: self)
        
        //setSpecialData1()
        updateUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter.readResturantData()
    }
    
    func updateUI() {
        
        allPressChanged.layer.cornerRadius = allPressChanged.frame.size.width / 2
        allPressChanged.layer.masksToBounds = true
        iCarouselView.layer.cornerRadius =  20.0
        iCarouselView.layer.masksToBounds = true
        iCarouselView.type = .rotary
        iCarouselView.isPagingEnabled = true
        
    }
    
    func changeCellColor() {
        
            checkCarousel = false
            allPressChanged.backgroundColor = #colorLiteral(red: 0.9539387822, green: 0.6407243013, blue: 0, alpha: 1)
            allPressChanged.tintColor = UIColor.white
            iCarouselView.type = .rotary
            collectionView.reloadData()
            iCarouselView.reloadData()
       
    }
    
    @IBAction func allResturantsPressed(_ sender: Any) {
        
        changeCellColor()
       
    }  
}




//    func setSpecialData(){
//        db.collection("resturantSpecialData").document("FirstMall").setData([
//            "mallName": "Mall Of Arabia ",
//            "resturantName": ["MOMEN", "MCDONALD", "KFC", "BUSKIN ROBBINS", "FIFTH", "SIXTH", "SEVENTH", "EIGHTH", "NINTH"],
//            "resturantImage": ["momen", "mcdonald", "third", "fourth", "fifth", "sixth", "seventh","eighth", "ninth"]
//        ]) { err in
//            if let err = err {
//                print("Error writing document: \(err)")
//            } else {
//                print("Document successfully written!")
//            }
//        }
//    }
//    func setSpecialData1(){
//        db.collection("resturantSpecialData").document("SecondMall").setData([
//            "mallName": "City Star ",
//            "resturantName": ["MOMEN", "MCDONALD", "KFC", "BUSKIN ROBBINS"],
//            "resturantImage": ["third", "fourth", "mcdonald", "sixth"]
//        ]) { err in
//            if let err = err {
//                print("Error writing document: \(err)")
//            } else {
//                print("Document successfully written!")
//            }
//        }
//    }
