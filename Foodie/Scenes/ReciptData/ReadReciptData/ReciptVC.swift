//
//  DataVC.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/27/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase
class ReciptVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var viewContainCollection: UIView!
    
    @IBOutlet weak var confirmDataButton: UIButton!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var item = ""
    var sectionNumber: Int!
    var myTag: Int!
//    var press = false
   
    var x:IndexPath!
    var sec: IndexPath!
            
    var dataDic = [String: [String]]()
    var ans:[[String]] = [[String]]()


    var getAnswer:[String:Any]!
    var detail:[ReciptDetail] = [ReciptDetail]()
    
    var detailMeal:[ReciptDetail] = [ReciptDetail]()
    var mealReceiveName = ""
    var mealReceiveImage = ""
    var mealReceivePrice = ""
    var Desc = ""
    var setDesc = ""
    var questions: [String] = []
    var newquestions: [String] = []
    var answers = [[String]]()
    var newAnswers = [[String]]()
    
    var dataPrice: [String:Int]!
    var countPrice = 0
    var amount = 0
    var arr = [[String]]()
     var newarr = [String]()
     var newVal:Int!
    var addCartCheck = false
    override func viewDidLoad() {
        super.viewDidLoad()
       //        setSpecialData1()
//               setSpecialData2()
       updateUI()
       readData()
    }
   
    
    override func viewDidAppear(_ animated: Bool) {
         
        self.newquestions = self.determineQuestion()
        newAnswers = determineAnswer()
        determinePrice()
        print("\(newAnswers) moooooo")
        determineHeight()
        collectionView.reloadData()
    }
    func updateUI(){
          viewContainCollection.layer.cornerRadius = 50
          viewContainCollection.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
          confirmDataButton.layer.cornerRadius = 15
          confirmDataButton.layer.masksToBounds = true
       }
       
     

    
    @IBAction func conform(_ sender: Any) {
      
     
        
    }
    
    @IBAction func amountStepper(_ sender: UIStepper) {
        if addCartCheck == true {
        print(newarr)
        for choosenData in newarr {
              for (key, value) in dataPrice {
               
               if choosenData == key {
                   newVal = value as? Int
                   countPrice += newVal
               }
           }
       }
        amount = countPrice * Int(sender.value)

        amountLabel.text = String(sender.value)
        totalPriceLabel.text = "\(amount) Pound"
        countPrice = 0
    }
        else {
            sender.value = 0.0
              alert(title: "Add To Cart First")
        }
    
}
    
    @IBAction func addCart(_ sender: Any) {
        
        determinePrice()
         if dataDic.count == newquestions.count {
            for (key,value) in dataDic {
             arr.append(dataDic[key]!)
            }
               print(arr)
            for i in arr {
             newarr.append(i.last!)
                addCartCheck = true
            }
         }
         else {
             
             alert(title: "Answer Above Questions")
         }
    }
    
}






















//    let FirstMeal: [String: Any] = [
//        "MealName": "Chicken & Rice",
//        "Description": "Pick 2 sandwiches from Big Mac (Beef/Burger)& McChicken +2 sandwiches from Beef Burger, Cheese Burger & Chickem McDo +2 regular fries + 1 litre Coke",
//
//            "Questions": ["Q1: Compo Options","Q2: Fries Type","Q3: Soft Drink"],
//            "answers": [
//                "answer1": ["Medium Compo", "Large Compo"],
//                "answer2": ["French Fries", "Crispy Fries"],
//                "answer3": ["Pepsi", "Mirinda", "7 Up"]
//            ],
//        "Prices" : [
//            "Medium Compo" : 25 ,
//            "Large Compo" : 45,
//            "French Fries" : 10,
//            "Crispy Fries" : 15,
//            "Pepsi" : 7,
//            "Mirinda" : 8,
//            "7 Up" : 0
//
//        ]
//    ]
//    let secondMeal: [String: Any] = [
//        "MealName": "BigMac",
//        "Description": "Pick 2 sandwiches from Big Mac (Beef/Burger)& McChicken +2 sandwiches from Beef Burger, Cheese Burger & Chickem McDo +2 regular fries + 1 litre Coke",
//
//            "Questions": ["Q1: TheSize","Q2: Type","Q3: How Much"],
//            "answers": [
//                "answer1": ["Medium", "Large"],
//                "answer2": ["French Fries", "Crispy Fries"],
//                "answer3": ["Pepsi", "Mirinda", "Coca"]
//            ],
//           "Prices" : [
//            "Medium Compo" : 25 ,
//            "Large Compo" : 45,
//            "French Fries" : 10,
//            "Crispy Fries" : 15,
//            "Pepsi" : 7,
//            "Mirinda" : 8,
//            "7 Up" : 0
//
//        ]
//    ]

//
//    func setSpecialData1(){
//       let db = Firestore.firestore()
//    db.collection("MealDetail").document("one").setData(FirstMeal) { err in
//        if let err = err {
//            print("Error writing document: \(err)")
//        } else {
//            print("Document successfully written!")
//        }
//    }
//    }
//    func setSpecialData2(){
//       let db = Firestore.firestore()
//    db.collection("MealDetail").document("two").setData(secondMeal) { err in
//        if let err = err {
//            print("Error writing document: \(err)")
//        } else {
//            print("Document successfully written!")
//        }
//    }
//    }
