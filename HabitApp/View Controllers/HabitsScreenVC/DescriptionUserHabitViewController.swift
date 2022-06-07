//
//  DescriptionUserHAbitViewController.swift
//  HabitApp
//
//  Created by Олейник Богдан on 06.06.2022.
//

import UIKit

class DescriptionUserHabitViewController: UIViewController {

    let label = UILabel(text: "Add", font: .avenir18())
    
    let habit: Habit
    
    init(habit: Habit) {
        self.habit = habit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor()
        label.text = habit.habitName
        setupLabel()        
    }
    
    private func setupLabel() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
