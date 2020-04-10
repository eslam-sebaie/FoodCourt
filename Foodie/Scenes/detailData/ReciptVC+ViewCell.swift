//
//  ReciptVC+ViewCell.swift
//  Foodie
//
//  Created by Eslam Sebaie on 4/10/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension ReciptVC: collecCellView {
    func chooseItem(name: String, indx: Int, tagBut: Int, selected: IndexPath) {
       item = name
        sectionNumber = indx
        myTag = tagBut
        x = selected
        
    }
}
