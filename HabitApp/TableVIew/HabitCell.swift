//
//  HabitCell.swift
//  HabitApp
//
//  Created by Олейник Богдан on 30.05.2022.
//

//import UIKit
//
//class HabitCell: UITableViewCell {
//
//    static var reuseId = "HabitCell"
//
//    let imageHabit = UIImageView()
//    let nameHabit = UILabel(text: "Habit", font: .avenir18(), textColor: .black)
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupConstraints()
//
////        self.layer.cornerRadius = 4
////        self.clipsToBounds = true
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupConstraints() {
//        nameHabit.translatesAutoresizingMaskIntoConstraints = false
//        imageHabit.translatesAutoresizingMaskIntoConstraints = false
//
//        addSubview(nameHabit)
//        addSubview(imageHabit)
//
////        nameHabit.backgroundColor = .black
//        imageHabit.backgroundColor = .red
//
//        NSLayoutConstraint.activate([
//            imageHabit.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            imageHabit.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            imageHabit.heightAnchor.constraint(equalToConstant: 50),
//            imageHabit.widthAnchor.constraint(equalToConstant: 50)
//        ])
//
//        NSLayoutConstraint.activate([
//            nameHabit.leadingAnchor.constraint(equalTo: imageHabit.trailingAnchor, constant: 20),
//            nameHabit.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
//            nameHabit.centerYAnchor.constraint(equalTo: self.centerYAnchor)
//        ])
//    }
//
//}


