//
//  MallTableViewCell.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 2/28/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit
import CLTypingLabel
class MallTableViewCell: UITableViewCell, cellView {
 
    

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var MallImages: UIImageView!
    @IBOutlet weak var LabelName: CLTypingLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        backgroundColor = UIColor.clear
        heightAnchor.constraint(equalToConstant: 200)
        shadowView.roundedCorner(radius: 20)
        shadowView.dropShadow()
        MallImages.layer.cornerRadius = 20.0
        MallImages.layer.masksToBounds = true
    }
    
    func setName(name: String) {
        LabelName.text = name
     }
     
     func setImage(image: String) {
        MallImages.image = UIImage(named: image)
     }

}
