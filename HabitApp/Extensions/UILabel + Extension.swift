//
//  UILabel + Extension.swift
//  HabitApp
//
//  Created by Олейник Богдан on 30.05.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont? = .avenir16()) {
        self.init()
        
        self.text = text
        self.font = font
    }
}

extension UILabel {
    
    convenience init(text: String, font: UIFont? = .avenir16(), textColor: UIColor?) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}

//extension UILabel {
//
//    convenience init(text: String, font: UIFont? = .avenir16(), textColor: UIColor?, weight: UIFont.Weight?) {
//        self.init()
//
//        self.text = text
//        self.font = font
//        self.textColor = textColor
//        self.f = weight
//    }
//}
