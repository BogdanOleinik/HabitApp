//
//  SettingViewController.swift
//  HabitApp
//
//  Created by Олейник Богдан on 30.05.2022.
//

import UIKit

class UserTasksViewController: UIViewController {

    let tasksList = HabitsList.getHabitsList()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let shadowButton = UIColor(#colorLiteral(red: 0.2745098039, green: 0.3098039216, blue: 0.4431372549, alpha: 1))
    
    var addButton: UIButton = {
        let button = UIButton()
        let image = UIImage.SymbolConfiguration(pointSize: 27, weight: .bold, scale: .large)
        button.setImage(UIImage(systemName: "plus", withConfiguration: image), for: .normal)
        button.imageView?.tintColor = .white
        button.backgroundColor = .buttonColor()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .backgroundColor()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        setupAddButton()
        setupNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
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
    
    private func setupAddButton() {
          view.addSubview(addButton)
          let size = CGFloat(70)
  
          NSLayoutConstraint.activate([
              addButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
              addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
              addButton.heightAnchor.constraint(equalToConstant: size),
              addButton.widthAnchor.constraint(equalToConstant: size)
          ])
  
          addButton.layer.cornerRadius = size / 2
  
          addButton.layer.shadowColor = shadowButton.cgColor
          addButton.layer.shadowOffset = CGSize(width: 0,
                                                height: 2)
          addButton.layer.shadowOpacity = 0.75
          addButton.layer.shadowRadius = 5
  
          addButton.layer.masksToBounds = false
          addButton.translatesAutoresizingMaskIntoConstraints = false
  
          addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
      }
  
      @objc func addButtonPressed() {
          let addHabitVC = AddHabitViewController()
          navigationController?.pushViewController(addHabitVC, animated: true)
      }
    
}

extension UserTasksViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = tasksList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = task.title
        content.secondaryText = task.secondText
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}

//struct UsersSection {
//    let title: String
//    let options: [UserTasksList]
//}
//
//struct UserTasksList {
//    let title: String
//    let icon: UIImage?
////    let iconBackgroundColor: UIColor
//    let handler: (() -> Void)
//}
//

//    let shadowButton = UIColor(#colorLiteral(red: 0.2745098039, green: 0.3098039216, blue: 0.4431372549, alpha: 1))
//
//    let tableView = UITableView(frame: .zero, style: .grouped)
//
//    var models = [UsersSection]()
//
//    var addButton: UIButton = {
//        let button = UIButton()
//        let image = UIImage.SymbolConfiguration(pointSize: 27, weight: .bold, scale: .large)
//        button.setImage(UIImage(systemName: "plus", withConfiguration: image), for: .normal)
//        button.imageView?.tintColor = .white
//        button.backgroundColor = .buttonColor()
//        return button
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .backgroundColor()
//        setupTableView()
//        setupNavigationBar()
//        configure()
//        setupAddButton()
//    }
//
//    private func setupTableView() {
//        title = "Tasks"
//        view.addSubview(tableView)
//        tableView.register(UserTasksListCell.self, forCellReuseIdentifier: UserTasksListCell.identifier)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.frame = view.bounds
//        tableView.backgroundColor = .backgroundColor()
//        tableView.separatorStyle = .none
//    }
//
//    private func setupNavigationBar() {
//        title = "Habits"
//        navigationController?.navigationBar.prefersLargeTitles = true
//
//        let navigationBarAppearance = UINavigationBarAppearance()
//
//        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        navigationBarAppearance.backgroundColor = .backgroundColor()
//
//        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
//        navigationController?.navigationBar.tintColor = .white
//
//    }
//
//    func configure() {
//        models.append(UsersSection(title: "TODAY", options: [
//            UserTasksList(title: "Wifi", icon: UIImage(named: "doneMark")) {
//                print("Tapped")
//            },
//            UserTasksList(title: "Bluetooth", icon: UIImage(named: "frameMark")) {
//
//            },
//            UserTasksList(title: "Bluetooth", icon: UIImage(named: "frameMark")) {
//
//            },
//        ]))
//
//        models.append(UsersSection(title: "TOMOROW", options: [
//            UserTasksList(title: "Bluetooth", icon: UIImage(named: "frameMark")) {
//
//            }
//
//        ]))
//
//        models.append(UsersSection(title: "ON WEAK", options: [
//            UserTasksList(title: "iCloud", icon: UIImage(systemName: "cloud")) {
//
//            }
//        ]))
//    }
//
//    private func setupAddButton() {
//        view.addSubview(addButton)
//        let size = CGFloat(70)
//
//        NSLayoutConstraint.activate([
//            addButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
//            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            addButton.heightAnchor.constraint(equalToConstant: size),
//            addButton.widthAnchor.constraint(equalToConstant: size)
//        ])
//
//        addButton.layer.cornerRadius = size / 2
//
//        addButton.layer.shadowColor = shadowButton.cgColor
//        addButton.layer.shadowOffset = CGSize(width: 0,
//                                              height: 2)
//        addButton.layer.shadowOpacity = 0.75
//        addButton.layer.shadowRadius = 5
//
//        addButton.layer.masksToBounds = false
//        addButton.translatesAutoresizingMaskIntoConstraints = false
//
//        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
//    }
//
//    @objc func addButtonPressed() {
//        let addHabitVC = AddHabitViewController()
//        navigationController?.pushViewController(addHabitVC, animated: true)
//    }
//
//}
//
//extension UserTasksViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let section = models[section]
//        return section.title
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        models.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        models[section].options.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let model = models[indexPath.section].options[indexPath.row]
//        guard let cell = (tableView.dequeueReusableCell(
//            withIdentifier: UserTasksListCell.identifier,
//            for: indexPath
//        ) as? UserTasksListCell) else {
//            return UITableViewCell()
//        }
//
//        cell.configure(with: model)
////        var content = cell.defaultContentConfiguration()
////
////        content.text = model.title
////        cell.contentConfiguration = content
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let model = models[indexPath.section].options[indexPath.row]
//        model.handler()
//    }
