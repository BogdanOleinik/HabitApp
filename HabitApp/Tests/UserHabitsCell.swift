//
//  HabitCollectionCell.swift
//  HabitApp
//
//  Created by Олейник Богдан on 30.05.2022.
//

//import UIKit
//
//protocol SelfConfiguringCell {
//    static var reuseId: String { get }
//    func configure(with value: Habit)
//}
//
//class UserHabitsCell: UICollectionViewCell, SelfConfiguringCell {
//    
//    static var reuseId = "HabitCell"
//    
//    let habitImageView = UIImageView()
//    let habitName = UILabel(text: "Run", font: .systemFont(ofSize: 22, weight: .regular), textColor: .textColor())
//    let habitCount = UILabel(text: "5", font: .systemFont(ofSize: 20, weight: .semibold), textColor: .textColor())
//    
//    func configure(with value: Habit) {
//        habitImageView.image = value.habitImage
//        habitName.text = value.habitName
//        habitCount.text = "\(value.habitCount)"
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .secondBackgroundColor()
//        setupConstraints()
//        
//        self.layer.cornerRadius = 10
//        self.clipsToBounds = true
//    }
//    
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupConstraints() {
//        habitImageView.translatesAutoresizingMaskIntoConstraints = false
//        habitName.translatesAutoresizingMaskIntoConstraints = false
//        habitCount.translatesAutoresizingMaskIntoConstraints = false
//        
//        habitImageView.backgroundColor = .systemTeal
//        
//        addSubview(habitImageView)
//        addSubview(habitName)
//        addSubview(habitCount)
//        
//        NSLayoutConstraint.activate([
//            habitImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            habitImageView.topAnchor.constraint(equalTo: self.topAnchor),
//            habitImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            habitImageView.widthAnchor.constraint(equalToConstant: 100)
//        ])
//        
//        NSLayoutConstraint.activate([
//            habitName.leadingAnchor.constraint(equalTo: habitImageView.trailingAnchor, constant: 20),
//            habitName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            habitName.trailingAnchor.constraint(equalTo: habitCount.leadingAnchor, constant: 10)
//        ])
//        
//        NSLayoutConstraint.activate([
//            habitCount.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            habitCount.topAnchor.constraint(equalTo: self.topAnchor),
//            habitCount.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            habitCount.widthAnchor.constraint(equalToConstant: 50)
//        ])
//    }
//    
//}
//
//// MARK: - SwiftUI
//import SwiftUI
//
//struct HabitVCProvider: PreviewProvider {
//    static var previews: some View {
//        ContainerView().edgesIgnoringSafeArea(.all)
//    }
//
//    struct ContainerView: UIViewControllerRepresentable {
//
//        let tabBar = TabBarController()
//
//        func makeUIViewController(context: UIViewControllerRepresentableContext<HabitVCProvider.ContainerView>) -> TabBarController {
//            return tabBar
//        }
//
//        func updateUIViewController(_ uiViewController: HabitVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<HabitVCProvider.ContainerView>) {
//
//        }
//    }
//}
