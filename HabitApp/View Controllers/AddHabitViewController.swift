//
//  AddHabitViewController.swift
//  HabitApp
//
//  Created by Олейник Богдан on 29.05.2022.
//

import UIKit

class AddHabitViewController: UITableViewController {
    
    let habits = Habits.getHabits()
    let identifire = "ChooseHabitCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        tableView.rowHeight = 70
    }
}

extension AddHabitViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        habits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        let habit = habits[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = habit.name
        
        cell.contentConfiguration = content
        return cell
    }
    
}
