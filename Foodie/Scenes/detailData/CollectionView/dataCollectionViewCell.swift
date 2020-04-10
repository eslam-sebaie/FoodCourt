//
//  dataCollectionViewCell.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/27/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit

protocol collecCellView {
    
    func chooseItem(name: String, indx: Int, tagBut: Int, selected:IndexPath)
}

class dataCollectionViewCell: UICollectionViewCell {
    
//    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    var delegate: collecCellView?
    var secindex: Int!
    var tagButton: Int!
    var select:IndexPath!
   
    

    
    override var isSelected: Bool {
         didSet{
            if self.isSelected {
                  self.backgroundColor = #colorLiteral(red: 0.9577311873, green: 0.7898001671, blue: 0, alpha: 1)
             }
             else {
                self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
             }
         }
     }
    
//    func setData(){
//        self.delegate?.chooseItem(name: detailName.text!, indx: secindex, tagBut: tagButton)
//
//    }
    
    @IBAction func chooseButton(_ sender: UIButton) {
//        print(detailName.text)
//        print(secindex)
        
        self.delegate?.chooseItem(name: detailName.text!, indx: secindex, tagBut: tagButton, selected: select)
    }
    
}
