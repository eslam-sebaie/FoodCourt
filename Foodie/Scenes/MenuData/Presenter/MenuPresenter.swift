//
//  MenuPresenter.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/22/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
protocol MenuView {
    func fetchData(menudata1: [menuData])
}
class MenuPresenter{
    
    var interactor = ReadMenuData()
    var newMenuData = [menuData]()
    var delegate: MenuView?
    init(view: MenuView) {
        self.delegate = view
    }
    func readData()
    {
           interactor.readMenuData { (menuData) in
            self.newMenuData = menuData
            self.delegate?.fetchData(menudata1: self.newMenuData)
        }
    }
}
