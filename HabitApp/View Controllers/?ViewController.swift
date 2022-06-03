//
//  AddHabitViewController.swift
//  HabitApp
//
//  Created by Олейник Богдан on 29.05.2022.
//

import UIKit

class AnotherViewController: UITableViewController {

    let habits = Habit.getHabits()
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

extension AnotherViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        habits.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        let habit = habits[indexPath.row]
        var content = cell.defaultContentConfiguration()

        content.text = habit.habitName

        cell.contentConfiguration = content
        return cell
    }

}

// MARK: - SwiftUI
import SwiftUI

struct AddHabitVC: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let tabBar = TabBarController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<AddHabitVC.ContainerView>) -> TabBarController {
            return tabBar
        }

        func updateUIViewController(_ uiViewController: AddHabitVC.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AddHabitVC.ContainerView>) {

        }
    }
}
