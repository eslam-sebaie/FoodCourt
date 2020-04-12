//
//  ResturantVC+Carosuel.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/22/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension ResturantVC: iCarouselDataSource, iCarouselDelegate {
     
     func numberOfItems(in carousel: iCarousel) -> Int {
    //        print("2")
            
            newNameArr = determineResturantName()
            newArr = determineResturantImage()
            if checkCarousel == true {
                iCarouselView.type = .custom
                return 1
            }
            else {
                
                return newArr.count
            }
        }
    
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
           switch (option) {
            case .spacing: return value * 2
    //       case .showBackfaces: return value * 0
    //        case .radius: return 200
    //        case .fadeMax: return 5
    //       case .angle: return value * 2
    //       case .arc: return value * 2
             case .fadeMinAlpha: return  0.5
             default: return value
        }
        }
        
        func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
            
            var imageView: UIImageView!
            
            if view == nil {
                imageView  = UIImageView(frame: CGRect(x: 0, y: 0, width: iCarouselView.frame.width - 60, height: iCarouselView.frame.height - 60))
            }
            else {
                imageView = view as? UIImageView
            }
            
           print(checkCarousel)
            if checkCarousel == true {
                Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
                    imageView.image = UIImage(named: self.newArr[self.newIndex])
                        imageView.layer.cornerRadius = 30
                        imageView.layer.masksToBounds = true
    //                    self.checkCarousel = false
                }
                return imageView
            }
            else {
    //            print("youssef")
                imageView.image = UIImage(named: newArr[index])
                imageView.layer.cornerRadius = 30
                imageView.layer.masksToBounds = true
                return imageView
            }
           
        }
       
        func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
            if checkCarousel == false {
                sendResturantName = newNameArr[index]
                performSegue(withIdentifier: "goToMeals", sender: self)
            }
            else {
                sendResturantName = nameOfCheckCarsoul
                performSegue(withIdentifier: "goToMeals", sender: self)
            }
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let mealVC = segue.destination as! MealViewController
            mealVC.resturantRecevingName = sendResturantName
            print(sendResturantName)
        }
}
