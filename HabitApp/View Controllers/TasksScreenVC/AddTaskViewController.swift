//
//  AddTaskViewController.swift
//  HabitApp
//
//  Created by Олейник Богдан on 07.06.2022.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var tasksList: [UserTasks] = []
    let shadowButton = UIColor(#colorLiteral(red: 0.2745098039, green: 0.3098039216, blue: 0.4431372549, alpha: 1))
    let taskTextField = LineTextField(font: .systemFont(ofSize: 22, weight: .semibold), tintColor: .textColor(), placeholder: "New task")
    let backButton: UIButton = {
        let button = UIButton()
        let image = UIImage.SymbolConfiguration(pointSize: 30, weight: .semibold, scale: .large)
        button.setImage(UIImage(systemName: "chevron.compact.down", withConfiguration: image), for: .normal)
        button.imageView?.tintColor = .secondTextColor()
        return button
    }()
    let saveButton: UIButton = {
        let button = UIButton()
        let image = UIImage.SymbolConfiguration(pointSize: 27, weight: .semibold, scale: .large)
        button.setImage(UIImage(systemName: "plus", withConfiguration: image), for: .normal)
        button.imageView?.tintColor = .white
        button.backgroundColor = .buttonColor()
        return button
    }()
    
    var delegate: AddTaskViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundColor()
        setupConstraints()
        setupAddButton()
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
    private func setupAddButton() {
        let size = CGFloat(70)
  
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        saveButton.layer.cornerRadius = size / 2
  
        saveButton.layer.shadowColor = shadowButton.cgColor
        saveButton.layer.shadowOffset = CGSize(width: 0,
                                                height: 2)
        saveButton.layer.shadowOpacity = 0.75
        saveButton.layer.shadowRadius = 5
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 30),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: size),
            saveButton.widthAnchor.constraint(equalToConstant: size),
        ])
    }
    
    private func setupConstraints() {
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        taskTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(taskTextField)
        
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 50),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            taskTextField.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            taskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            taskTextField.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    @objc func saveButtonPressed() {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "UserTasks", in: context) else { return }
        guard let task = NSManagedObject(entity: entityDescription, insertInto: context) as? UserTasks else { return }
        task.taskName = taskTextField.text
        if task == task {
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        delegate?.reloadData()
        dismiss(animated: true)
        } else {
            return
        }
    }
    
    @objc func backButtonPressed() {
        dismiss(animated: true)
    }

}
