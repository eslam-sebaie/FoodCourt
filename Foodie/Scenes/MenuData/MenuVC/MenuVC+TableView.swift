//
//  MenuVC+TableView.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/22/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension MealViewController: UITableViewDataSource, UITableViewDelegate{
    
       func numberOfSections(in tableView: UITableView) -> Int {
           
           return 1
       }
       
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
            print(newImageArray.count)
           return newImageArray.count
       }
       
       
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MealViewCell
           
           cell.mealImage.image = UIImage(named: newImageArray[indexPath.row])
           cell.mealName.text = newMealNameArray[indexPath.row]
           cell.mealPrice.text = newMealPriceArray[indexPath.row] + " " + "EGY"
           activityIndicator.isHidden = true
           loadingLabel.isHidden = true
           activityView.isHidden = true
           print(newImageArray[indexPath.row])
           cell.backgroundColor = UIColor.clear
           
           return cell
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = sb.instantiateViewController(withIdentifier: "ReciptVC") as! ReciptVC
        detailVC.mealReceiveName = newMealNameArray[indexPath.row]
        detailVC.mealReceivePrice = newMealPriceArray[indexPath.row]
        detailVC.mealReceiveImage = newImageArray[indexPath.row]
        self.present(detailVC,animated: true)
       
    }
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
           let rotateTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
           cell.layer.transform = rotateTransform
           UIView.animate(withDuration: 1.0) {
               
               cell.layer.transform = CATransform3DIdentity
           }
           
       }
}
