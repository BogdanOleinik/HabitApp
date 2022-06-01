//
//  UIButton + Extension.swift
//  HabitApp
//
//  Created by Олейник Богдан on 30.05.2022.
//

import UIKit

class AddButton: UIView {
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let myImage = #imageLiteral(resourceName: "plus")
        button.setImage(myImage, for: .normal)
        button.tintColor = .black
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(addButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            addButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            addButton.widthAnchor.constraint(equalToConstant: 80),
            addButton.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addButton.layer.masksToBounds = true
        addButton.layer.cornerRadius = addButton.frame.width / 2
    }
}
//extension UIButton {
//
//    convenience init(title: String,
//                     titleColor: UIColor,
//                     backgroundColor: UIColor,
//                     isShadow: Bool = false,
//                     cornerRadius: CGFloat) {
//        self.init(type: .system)
//
//        self.setTitle(title, for: .normal)
//        self.setTitleColor(titleColor, for: .normal)
//        self.backgroundColor = backgroundColor
//        self.layer.cornerRadius = cornerRadius
//
//        if cornerRadius {
//            self.layer.cornerRadius =
//        }
//
//        if isShadow {
//            self.layer.shadowColor = UIColor.black.cgColor
//            self.layer.shadowRadius = 4
//            self.layer.shadowOpacity = 0.2
//            self.layer.shadowOffset = CGSize(width: 0, height: 4)
//        }
//    }
//
//    func castomizeAddButton() {
//        let plus = UIImageView(image: UIImage(named: "picture"), contentMode: .scaleAspectFit)
//        plus.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(plus)
//        NSLayoutConstraint.activate([
//            plus.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            plus.centerYAnchor.constraint(equalTo: self.centerYAnchor)
//        ])
//    }
//}

