//
//  R:W.RealmData.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/19/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import RealmSwift
class RealmData {
    
    let realm = try! Realm()
    var userData: Results<personalInfo>?
    
    func deleteData(user: personalInfo) {
           
           do {
               try realm.write {
                   realm.delete(user)
               }
           }catch {
               
           }
           
       }
     func saveData(personal: personalInfo){
           
           do {
               try realm.write {
                   realm.add(personal)
               }
               
           }catch{
               print("error")
           }
       }
    
    func readData() -> Results<personalInfo> {
          userData = realm.objects(personalInfo.self)
          return userData!
      }
}
