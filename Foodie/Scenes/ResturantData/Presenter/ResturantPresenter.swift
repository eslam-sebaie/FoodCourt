//
//  ResturantPresenter.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/22/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
protocol resturantView {
    func fetchData(newData: [resturantData])
}
class ResturantPresenter {
    
    var interactor = ResturantData()
    var newResturantdata: [resturantData] = [resturantData()]
    var delegate: resturantView?
    
    init(view: resturantView) {
        self.delegate = view
    }
    
    func readResturantData(){
        
        interactor.readResturantData { (resturantData) in
            
            self.newResturantdata = resturantData
            self.delegate?.fetchData(newData: self.newResturantdata)
            
        }
        
    }
}
