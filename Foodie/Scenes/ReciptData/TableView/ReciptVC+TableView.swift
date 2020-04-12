//
//  ReciptVC+TableView.swift
//  Foodie
//
//  Created by Eslam Sebaie on 4/10/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension ReciptVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! DataTableViewCell
        cell.mealName.text = mealReceiveName
        cell.mealDescription.text = setDesc
        cell.mealPrice.text = mealReceivePrice + " " + "EGY"
        cell.mealImage.image = UIImage(named: mealReceiveImage)
        cell.mealImage.layer.cornerRadius = 8
        cell.mealImage.layer.masksToBounds = true
        cell.dataView.layer.cornerRadius = 12
        cell.dataView.layer.masksToBounds = true

        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
}
