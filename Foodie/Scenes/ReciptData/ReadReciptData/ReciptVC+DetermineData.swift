//
//  ReciptVC+DetermineData.swift
//  Foodie
//
//  Created by Eslam Sebaie on 4/12/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension ReciptVC {
    
    func readData(){
     read { (dataDetail) in
        self.detailMeal = dataDetail
        self.setDesc = self.determineDescription()
      }
    }
    
    
    func determineDescription()-> String{
            for val in detailMeal {
              if mealReceiveName == val.mealName {
                  Desc = val.descrition
                }
                else {
                    print("in else")
                }
            }
          return Desc
            
      }
     func determineQuestion() -> [String]{
          for val in detailMeal {
            if mealReceiveName == val.mealName {
              questions = val.question
              }
              else {
                  print("in else")
              }
          }
          return questions
    }
     func determineAnswer() -> [[String]]{
           for val in detailMeal {
             if mealReceiveName == val.mealName {
               answers = val.answers
               }
               else {
                   print("in else")
               }
           }
         return answers
     }
      
      func determineHeight(){
          for cons in collectionView.constraints {
                     
             if cons.identifier == "myHeightConstraint"
             {
                 cons.constant = CGFloat(newquestions.count * 100)
             }
             
         }
           collectionView.layoutIfNeeded()
      }
}
