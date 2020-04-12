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
//    var data = [dataModel(headerName: "Q1: TheSize", subType: ["small", "medium", "Large"], isExpandable: false),
//                   dataModel(headerName: "Q2: Type", subType: ["Normal", "spices"], isExpandable: false),
//                   dataModel(headerName: "Q3: How Much", subType: ["1 kilo", "2 kilo", "3 kilo", "4 kilo"], isExpandable: false)
//
//    ]
    
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
    
    
    
      
    override func viewDidLoad() {
        super.viewDidLoad()
       //        setSpecialData1()
       //        setSpecialData2()
       updateUI()
       readData()
    }
   
    
    override func viewDidAppear(_ animated: Bool) {
         
        self.newquestions = self.determineQuestion()
        newAnswers = determineAnswer()
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
        var arr = [[String]]()
        var newarr = [String]()
        
        if dataDic.count == newquestions.count {
           for (key,value) in dataDic {
            arr.append(dataDic[key]!)
           }
              print(arr)
           for i in arr {
            newarr.append(i.last!)
           }
           print(newarr)
        }
        else {
            alert()
        }
    }
    
}





















//
//    let FirstMeal: [String: Any] = [
//        "MealName": "Chicken & Rice",
//        "Description": "Pick 2 sandwiches from Big Mac (Beef/Burger)& McChicken +2 sandwiches from Beef Burger, Cheese Burger & Chickem McDo +2 regular fries + 1 litre Coke",
//
//            "Questions": ["Q1: Compo Options","Q2: Fries Type","Q3: Soft Drink"],
//            "answers": [
//                "answer1": ["Medium Compo", "Large Compo"],
//                "answer2": ["French Fries", "Crispy Fries"],
//                "answer3": ["Pepsi", "Mirinda", "7 Up"]
//            ]
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
//            ]
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
