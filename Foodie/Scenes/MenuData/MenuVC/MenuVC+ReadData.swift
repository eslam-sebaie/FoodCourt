//
//  MenuVC+ReadData.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/22/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension MealViewController: MenuView {
    func fetchData(menudata1: [menuData]) {
        self.menudata = menudata1
        print("eslam sebaie  \(menudata)")
        tableView.reloadData()
    }

    
    
}
