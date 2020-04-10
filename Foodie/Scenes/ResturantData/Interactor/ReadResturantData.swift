//
//  ReadResturantData.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/22/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import Firebase
class ResturantData{
    
    var resturantdata: [resturantData] = [resturantData()]
     
    func readResturantData(success: @escaping ([resturantData]) -> Void) {
      
        let db = Firestore.firestore()
        db.collection("resturantSpecialData").getDocuments() { (querySnapshot, err) in
            var newData = resturantData()
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                if let myDoc = querySnapshot?.documents {
                    for document in myDoc {
                        let data = document.data()
                        guard let mallname = data["mallName"] as? String else {return}
                         guard let resturantname = data["resturantName"] as? [String] else {return}
                        guard let image = data["resturantImage"] as? [String] else {return}
                        newData = resturantData(mallName: mallname, resturantName: resturantname, resturantImage: image)
                        self.resturantdata.append(newData)
                    }
                    success(self.resturantdata)
                }
            }
        }
    }
}
