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
    var data = [dataModel(headerName: "Q1: TheSize", subType: ["small", "medium", "Large"], isExpandable: false),
                   dataModel(headerName: "Q2: Type", subType: ["Normal", "spices"], isExpandable: false),
                   dataModel(headerName: "Q3: How Much", subType: ["1 kilo", "2 kilo", "3 kilo", "4 kilo"], isExpandable: false)
                   
    ]
    var item = ""
    var sectionNumber: Int!
    var myTag: Int!
    var press = false
   
    var x:IndexPath!
//    var arr = [Int]()
    
    var sec: IndexPath!
        
//        answer(ans: [["small", "medium", "Large"],["Normal", "spices"],["1 kilo", "2 kilo", "3 kilo", "4 kilo"]])
    
    var dataDic = [String: [String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContainCollection.layer.cornerRadius = 50
        viewContainCollection.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        confirmDataButton.layer.cornerRadius = 15
        confirmDataButton.layer.masksToBounds = true
        determineHeight()
//        setSpecialData()
        
    }
    
    func determineHeight(){
        for cons in collectionView.constraints {
                   
           if cons.identifier == "myHeightConstraint"
           {
               cons.constant = CGFloat(data.count * 100)
           }
           
       }
         collectionView.layoutIfNeeded()
    }
  
 

    
    @IBAction func conform(_ sender: Any) {
//        print(dataDic)
//        print(dataDic.count)
//
        var arr = [[String]]()
        var newarr = [String]()
        
        if dataDic.count == data.count {
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

extension Dictionary where Value: RangeReplaceableCollection {
    public mutating func append(element: Value.Iterator.Element, toValueOfKey key: Key) -> Value? {
        var value: Value = self[key] ?? Value()
        value.append(element)
        self[key] = value
        return value
    }
}

