//
//  LineTextField.swift
//  HabitApp
//
//  Created by Олейник Богдан on 07.06.2022.
//

import UIKit

class LineTextField: UITextField {
    
    convenience init(
        font: UIFont? = .systemFont(ofSize: 22, weight: .semibold),
        tintColor: UIColor?,
        placeholder: String?) {
            self.init()
            
            self.font = font
            self.tintColor = tintColor
            self.placeholder = placeholder
            self.borderStyle = .none
            self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
