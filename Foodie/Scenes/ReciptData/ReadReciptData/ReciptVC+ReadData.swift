//
//  ReciptVC+ReadData.swift
//  Foodie
//
//  Created by Eslam Sebaie on 4/12/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import Firebase
extension ReciptVC {
    func read(success: @escaping ([ReciptDetail]) -> Void){
              let db = Firestore.firestore()
              var newData = ReciptDetail()
              var answerValue = [String]()
              db.collection("MealDetail").getDocuments() { (querySnapshot, err) in
                  if let err = err {
                      print("Error getting documents: \(err)")
                  } else  if let myDoc = querySnapshot?.documents {
                       for document in myDoc {
                          let results = document.data()
                          let name = results["MealName"] as? String
                          let desc = results["Description"] as? String
                          let ques = results["Questions"] as? [String]
                          if let idData = results["answers"] as? [String: Any] {
                              self.getAnswer = idData
                              for (key,value) in self.getAnswer {
                                  
                                 answerValue = value as! [String]
                                  self.ans.append(answerValue)
                                  
                              }
                              print(self.ans)
                              
                          }
                          newData = ReciptDetail(mealName: name, descrition: desc, question: ques, answers: self.ans)
                          self.detail.append(newData)
                          self.ans = []
                          success(self.detail)
                          
                      }
                  }
              }
          }
          
}
