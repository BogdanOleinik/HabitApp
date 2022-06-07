//
//  SettingViewController.swift
//  HabitApp
//
//  Created by Олейник Богдан on 30.05.2022.
//

import UIKit
import CoreData

protocol AddTaskViewControllerDelegate {
    func reloadData()
}

class UserTasksViewController: UIViewController {
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    private var tasksList: [UserTasks] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TestTableViewCell.self, forCellReuseIdentifier: TestTableViewCell.identifier)
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
        
        fetchData()
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
          let addTaskVC = AddTaskViewController()
          addTaskVC.delegate = self
          present(addTaskVC, animated: true)
      }
    
    private func fetchData() {
        let fetchRequest = UserTasks.fetchRequest()
        
        do {
            tasksList = try context.fetch(fetchRequest)
        } catch let error {
            print("Failed to fetch data", error)
        }
    }
    
}

extension UserTasksViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCell.identifier, for: indexPath) as! TestTableViewCell
        let task = tasksList[indexPath.row]
        cell.myLabel.text = task.taskName
//        var content = cell.defaultContentConfiguration()
//        content.text = task.taskName
//        content.secondaryText = task.secondText
//        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let task = tasksList[indexPath.row]
        
        if editingStyle == .delete {
            tasksList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            context.delete(task)
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
    }
}

extension UserTasksViewController: AddTaskViewControllerDelegate {
    func reloadData() {
        fetchData()
        tableView.reloadData()
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
