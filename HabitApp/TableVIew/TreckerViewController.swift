//
//  ViewController.swift
//  HabitApp
//
//  Created by Олейник Богдан on 29.05.2022.
//

import UIKit

class TreckerViewController: UIViewController {

    let habits = HabitsList.getHabitsList()
    var tableView = UITableView()
    let identifire = "HabitCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        createTableView()
        setupNavigationBar()
    }


    private func createTableView() {
        self.tableView = UITableView(frame: view.bounds)
        tableView.register(HabitCell.self, forCellReuseIdentifier: HabitCell.reuseId)
        tableView.backgroundColor = .backgroundColor()

        self.tableView.delegate = self
        self.tableView.dataSource = self

        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        view.addSubview(tableView)
    }

    private func setupNavigationBar() {
        title = "List"

        let navigationBarApperance = UINavigationBarAppearance()
        navigationBarApperance.backgroundColor = UIColor(#colorLiteral(
            red: 0.6810721159,
            green: 0.7772024274,
            blue: 1,
            alpha: 1)
        )
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
        navigationController?.pushViewController(addHabitVC, animated: true)
    }

}

extension TreckerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        habits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath) as? HabitCell) else { fatalError() }
        let habit = habits[indexPath.row]
        cell.imageHabit.image = UIImage(named: "\(habit.image)")
        cell.nameHabit.text = habit.title

        cell.backgroundColor = .backgroundColor()
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
}

// MARK: - SwiftUI
import SwiftUI

struct TreckerVC: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let tabBar = TreckerViewController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<TreckerVC.ContainerView>) -> TreckerViewController {
            return tabBar
        }

        func updateUIViewController(_ uiViewController: TreckerVC.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<TreckerVC.ContainerView>) {

        }
    }
}
