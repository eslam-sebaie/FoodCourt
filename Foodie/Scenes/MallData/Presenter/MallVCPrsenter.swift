//
//  MallVCPrsenter.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/20/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import Firebase
protocol MallView{
    func getData(theDataMall: mallData)
}
protocol cellView {
    func setName(name:String)
    func setImage(image: String)
}

class MallPresenter {
    
    var delegate: MallView?
    
    var interactor = FirebaseData()
    var malldata: mallData = mallData(name: [], image: [])
    
   
    init(view: MallView) {
        self.delegate = view
    }
    
    init() {}
    
    func readData(){
        interactor.readMallData { (mall) in
            self.malldata = mall
            self.delegate?.getData(theDataMall: mall)
        }
    }
    
    func putData(cell: cellView, indexPath: Int) {
        cell.setName(name: malldata.name[indexPath])
        cell.setImage(image: malldata.image[indexPath])
    }
}
