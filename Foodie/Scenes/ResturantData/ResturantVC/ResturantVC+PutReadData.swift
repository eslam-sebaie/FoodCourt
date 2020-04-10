//
//  ResturantVC+PutReadData.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/22/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension ResturantVC {
    
    func determineResturantImage() -> [String]{

         for val in resturantdata {
             if nameOfMall == val.mallName {
                 imgArr = val.resturantImage
             }
         }
         return imgArr
     }
     func determineResturantName() -> [String]{

         for val in resturantdata {
             if nameOfMall == val.mallName {
                 nameArr = val.resturantName
             }
         }
         return nameArr
     }
}
