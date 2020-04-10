//
//  NameCollectionViewCell.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/12/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit

class NameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var labelName: UILabel!
    
    override var isSelected: Bool {
            didSet{
               if self.isSelected {
                     self.backgroundColor = #colorLiteral(red: 0.9539387822, green: 0.6407243013, blue: 0, alpha: 1)
                     labelName.textColor = UIColor.white
                }
                else {
                   self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                   labelName.textColor = UIColor.black
                }
            }
        }
}
