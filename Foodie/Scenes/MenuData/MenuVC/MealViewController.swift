//
//  MealViewController.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 2/28/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

class MealViewController: UIViewController {
   
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    var imagesArray: [String] = []
    var newImageArray: [String] = []
    var mealNameArray: [String] = []
    var newMealNameArray: [String] = []
    var mealPriceArray: [String] = []
    var newMealPriceArray: [String] = []
    var resturantRecevingName = ""
    var interactor = ReadMenuData()
    
    var menudata: [menuData] = []
   
    var presenter: MenuPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MenuPresenter(view: self)
        //        setSpecialData()
        //        setSpecialData1()
        //        setSpecialData2()
        updateUI()

       
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter.readData()
    }
    
    func updateUI(){
        title = resturantRecevingName + " " + "MENU"
        tableView.rowHeight = 340
        activityView.alpha = 0.8
        activityView.layer.cornerRadius = 20.0
        activityView.layer.masksToBounds = true
        tableView.backgroundView = UIImageView(image: UIImage(named: "menuBack2"))
    }
   
    override func viewDidAppear(_ animated: Bool) {
         newImageArray = determineImageName()
         newMealNameArray = determineMealName()
         newMealPriceArray = determineMealPrice()
         tableView.reloadData()
        
    }
    
    
    
    
    
    
   
    // MARK: - Table view data source
    
    
    
    
    //
    //        func setSpecialData(){
    //            db.collection("menuSpecialData").document("1stMall1stResturants").setData([
    //
    //                "resturantName": "MOMEN",
    //                "resturantImage": ["mac8", "mac6", "mac7","mac3","mac4","mac5","mac1", "mac2"]
    //
    //            ]) { err in
    //                if let err = err {
    //                    print("Error writing document: \(err)")
    //                } else {
    //                    print("Document successfully written!")
    //                }
    //            }
    //        }
    //    func setSpecialData1(){
    //        db.collection("menuSpecialData").document("1stMall2ndResturants").setData([
    //
    //            "resturantName": "MCDONALD",
    //            "resturantImage": ["mac6","mac7","mac3","mac4","mac8","mac5"],
    //            "ThirdResturant": ["KFC":["mac6","mac7","mac3","mac4","mac5","mac8"]]
    //        ]) { err in
    //            if let err = err {
    //                print("Error writing document: \(err)")
    //            } else {
    //                print("Document successfully written!")
    //            }
    //        }
    //    }
    //    func setSpecialData2(){
    //        db.collection("menuSpecialData").document("1stMall3rdResturants").setData([
    //
    //            "resturantName": "KFC",
    //            "resturantImage": ["mac6","mac7","mac3","mac4","mac5","mac8"]
    //
    //        ]) { err in
    //            if let err = err {
    //                print("Error writing document: \(err)")
    //            } else {
    //                print("Document successfully written!")
    //            }
    //        }
    //    }
}
