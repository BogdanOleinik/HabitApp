//
//  AddHabitViewController.swift
//  HabitApp
//
//  Created by Олейник Богдан on 29.05.2022.
//

import UIKit

class AddHabitViewController: UIViewController {

    let habits = HabitsList.getHabitsList()
    var tableView = UITableView()
    let identifire = "HabitCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        createTableView()
    }

    private func createTableView() {
        self.tableView = UITableView(frame: view.bounds)
        tableView.register(AllHabitsCell.self, forCellReuseIdentifier: AllHabitsCell.reuseId)
        tableView.backgroundColor = .backgroundColor()

        self.tableView.delegate = self
        self.tableView.dataSource = self

        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        view.addSubview(tableView)
    }

    private func setupNavigationBar() {
        title = "Habits"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navigationBarAppearance = UINavigationBarAppearance()
        
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearance.backgroundColor = .backgroundColor()
        
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.tintColor = .white
    }

    @objc private func addHabit() {
        let addHabitVC = AddHabitViewController()
        navigationController?.pushViewController(addHabitVC, animated: true)
    }

}

// MARK: - UITableView
extension AddHabitViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        habits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath) as? AllHabitsCell) else { fatalError() }
        let habit = habits[indexPath.row]
        cell.imageHabit.image = UIImage(systemName: habit.image)
        cell.nameHabit.text = habit.title

        cell.backgroundColor = .backgroundColor()
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let habit = habits[indexPath.row]
        let vc = SettingHabitViewController(habit: habit)
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - SwiftUI
import SwiftUI

struct TreckerVC: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let tabBar = AddHabitViewController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<TreckerVC.ContainerView>) -> AddHabitViewController {
            return tabBar
        }

        func updateUIViewController(_ uiViewController: TreckerVC.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<TreckerVC.ContainerView>) {

        }
    }
}
