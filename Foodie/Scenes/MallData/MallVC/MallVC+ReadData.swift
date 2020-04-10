//
//  MallVC+ReadData.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/20/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import Firebase
extension MallVC: MallView {
    
    func getData(theDataMall: mallData) {
             self.myMalldata = theDataMall
//              print("\(self.myMalldata) eslam")
             self.tableView.reloadData()
         }
         
}
