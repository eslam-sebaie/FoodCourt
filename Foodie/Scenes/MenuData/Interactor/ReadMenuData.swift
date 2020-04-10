//
//  MenuData.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/22/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import Firebase
class ReadMenuData{
    
    var menudata: [menuData] = [menuData]()
    func readMenuData(success: @escaping ([menuData]) -> Void) {
        var newData = menuData()
         let db = Firestore.firestore()
        db.collection("menuSpecialData").getDocuments() { (querySnapshot, err) in
            //self.menudata = []
            
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                if let myDoc = querySnapshot?.documents {
                    for document in myDoc {
                        let data = document.data()
                        guard let resturantname = data["resturantName"] as? String else {return}
                        guard let image = data["resturantImage"] as? [String] else {return}
                        guard let mealName = data["mealName"] as? [String] else {return}
                        guard let mealPrice = data["mealPrice"] as? [String] else {return}
                        newData = menuData(resturantName: resturantname, menuImage: image, mealName: mealName, mealPrice: mealPrice)
                        self.menudata.append(newData)
//                         print(self.menudata)
                        success(self.menudata)
//                        DispatchQueue.main.async {
//                            self.tableView.reloadData()
//
//                        }
//                        print(self.menudata.count)
                    }
                    print(self.menudata)
                    
                }
            }
        }
    }
}
