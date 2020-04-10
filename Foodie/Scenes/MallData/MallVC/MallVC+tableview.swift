//
//  MallVC+tableview.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/20/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension MallVC: UITableViewDelegate, UITableViewDataSource {
    
     
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
     }
        
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return myMalldata.name.count
         }
    
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MallTableViewCell
            
            presenter.putData(cell: cell, indexPath: indexPath.row)
            activityIndicator.isHidden = true
            loadingLabel.isHidden = true
            activityView.isHidden = true
            
            return cell
        }
    
         func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            mallString = myMalldata.name[indexPath.row]
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let carVC = sb.instantiateViewController(withIdentifier: "ResturantVC") as! ResturantVC
            carVC.nameOfMall = mallString
             self.navigationController?.pushViewController(carVC, animated: true)
//            self.present(carVC ,animated: true, completion: nil)
    
        }

        
         func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            let rotateTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
            cell.layer.transform = rotateTransform
            UIView.animate(withDuration: 1.0) {
                
                cell.layer.transform = CATransform3DIdentity
            }
            
        }
        
        
}
