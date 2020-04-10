//
//  MallFirebaseData.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/20/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import Firebase
class FirebaseData {
    
  
    //    func setSpecialData(){
    
    //        db.collection("mallSpecialData").document("MALLData").setData([
    //
    //            "mallName": ["Mall Of Arabia ", "City Star ", "Cairo Festival", "Mall Of Egypt"],
    //            "mallImage": ["Mall_Of_Arabia", "city_Star","cairo_festival", "Mall_Of_Egypt"]
    //        ]) { err in
    //            if let err = err {
    //                print("Error writing document: \(err)")
    //            } else {
    //                print("Document successfully written!")
    //            }
    //        }
    //    }
    
      var presenter: MallPresenter!
   func readMallData(success: @escaping (mallData) -> Void) {

                 presenter = MallPresenter()
                 let db = Firestore.firestore()
                 db.collection("mallSpecialData").getDocuments() { (querySnapshot, err) in
                     //self.malldata = []
                     if let err = err {
                         print("Error getting documents: \(err)")
                     } else {
                         if let myDoc = querySnapshot?.documents {
                             for document in myDoc {
                                 let data = document.data()
                                 guard let name:[String] = data["mallName"] as? [String] else {return}
                                 guard let image:[String] = data["mallImage"] as? [String] else {return}
                                 let newData = mallData(name: name, image: image)
                                 self.presenter.malldata = newData
                                success(newData)
                             }
                         }
                     }
                 }
              
              
              
              
              
             }
    
}
