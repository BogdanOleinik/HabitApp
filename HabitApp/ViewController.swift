//
//  ViewController.swift
//  HabitApp
//
//  Created by Олейник Богдан on 29.05.2022.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "List"
        
        let navigationBarApperance = UINavigationBarAppearance()
        
        navigationBarApperance.backgroundColor = UIColor(#colorLiteral(red: 0.6810721159, green: 0.7772024274, blue: 1, alpha: 1))
        
        navigationBarApperance.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addHabit)
        )
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = navigationBarApperance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarApperance
        
    }
    
    @objc private func addHabit() {
        let addHabitVC = AddHabitViewController()
        present(addHabitVC, animated: true)
    }

}

