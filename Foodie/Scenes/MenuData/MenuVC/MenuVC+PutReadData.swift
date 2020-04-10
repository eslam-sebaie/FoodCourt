//
//  MenuVC+PutReadData.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/22/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension MealViewController {
    
    func determineImageName () -> [String] {
           print("in")
        print("Aliii\(menudata)")
           for val in menudata {
               print("infor")
               if resturantRecevingName == val.resturantName {
                   imagesArray = val.menuImage
                   print(imagesArray)
               }
               else {
                   print("in else")
               }
           }
           return imagesArray
       }
       func determineMealName () -> [String] {
           print("in")
           for val in menudata {
               print("infor")
               if resturantRecevingName == val.resturantName {
                   mealNameArray = val.mealName
                   print(imagesArray)
               }
               else {
                   print("in else")
               }
           }
           return mealNameArray
       }
       func determineMealPrice () -> [String] {
           
           for val in menudata {
               if resturantRecevingName == val.resturantName {
                   mealPriceArray = val.mealPrice
                   // print(imagesArray)
               }
               else {
                   print("in else")
               }
           }
           return mealPriceArray
       }
       
}
