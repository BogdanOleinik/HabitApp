//
//  TestTableViewCell.swift
//  HabitApp
//
//  Created by Олейник Богдан on 04.06.2022.
//

//import UIKit
//
//class TestTableViewCell: UITableViewCell {
//    static let identifier = "testCell"
//    
//    let myLabel: UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 18, weight: .semibold)
//        label.tintColor = .textColor()
//        label.text = "CelllllllllllllllllllllllllCelllllllC"
//        return label
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.backgroundColor = .backgroundColor()
//        contentView.addSubview(myLabel)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        myLabel.frame = CGRect(
//            x: 25,
//            y:  0,
//            width: contentView.frame.size.width - 50,
//            height: contentView.frame.size.height)
//    }
//    
//}
