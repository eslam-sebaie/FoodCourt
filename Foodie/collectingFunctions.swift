//
//  gradient.swift
//  
//
//  Created by Eslam Sebaie on 2/2/20.
//

import UIKit
import RealmSwift
struct fetchFunctions {
    let realm = try! Realm()
    var userData: Results<personalInfo>?
    
    func partialGradient(forViewSize size: CGSize, proportion p: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        let context = UIGraphicsGetCurrentContext()
        
        
        context?.setFillColor(UIColor.darkGray.cgColor)
        context?.fill(CGRect(origin: .zero, size: size))
        
        let c1 = UIColor.magenta.cgColor
        let c2 = UIColor.cyan.cgColor
        
        let top = CGPoint(x: 0, y: size.height * (1.0 - p))
        let bottom = CGPoint(x: size.width, y: 0)
        
        let colorspace = CGColorSpaceCreateDeviceRGB()
        
        if let gradient = CGGradient(colorsSpace: colorspace, colors: [c1, c2] as CFArray, locations: [0.0, 1.0]){
            // change 0.0 above to 1-p if you want the top of the gradient orange
            context?.drawLinearGradient(gradient, start: top, end: bottom, options: CGGradientDrawingOptions.drawsAfterEndLocation)
        }
        
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
    func deleteData(user: personalInfo) {
        
        do {
            try realm.write {
                realm.delete(user)
            }
        }catch {
            
        }
        
    }
    func saveData(personal: personalInfo){
        
        do {
            try realm.write {
                realm.add(personal)
            }
            
        }catch{
            print("error")
        }
    }
    
     
    
}
