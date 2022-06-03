//
//  StackView + Extension.swift
//  HabitApp
//
//  Created by Олейник Богдан on 02.06.2022.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangeSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangeSubviews)
        self.axis = axis
        self.spacing = spacing
    }
}

