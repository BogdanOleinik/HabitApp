//
//  HabitCollectionCell.swift
//  HabitApp
//
//  Created by Олейник Богдан on 30.05.2022.
//

import UIKit

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with value: Habit)
}

class HabitCollectionCell: UICollectionViewCell {
    
    static var reuseId = "HabitCell"
    
    let habitImageView = UIImageView()
    let habitName = UILabel(text: "Run", font: .avenir18(), textColor: .black)
    let habitCount = UILabel(text: "5 km", font: .avenir18(), textColor: .black)
    
    func configure(with value: Habit) {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        habitImageView.translatesAutoresizingMaskIntoConstraints = false
        habitName.translatesAutoresizingMaskIntoConstraints = false
        habitCount.translatesAutoresizingMaskIntoConstraints = false
        
        habitImageView.backgroundColor = .systemTeal
        
        addSubview(habitImageView)
        
        NSLayoutConstraint.activate([
            habitImageView.leftAnchor.constraint(equalTo: self.leadingAnchor),
            habitImageView.topAnchor.constraint(equalTo: self.topAnchor),
            habitImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
}

// MARK: - SwiftUI
import SwiftUI

struct HabitVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let tabBar = TabBarController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<HabitVCProvider.ContainerView>) -> TabBarController {
            return tabBar
        }

        func updateUIViewController(_ uiViewController: HabitVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<HabitVCProvider.ContainerView>) {

        }
    }
}
