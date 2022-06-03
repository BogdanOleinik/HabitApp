//
//  HabitViewController.swift
//  HabitApp
//
//  Created by Олейник Богдан on 30.05.2022.
//

import UIKit
import SwiftUI

class UserHabitsViewController: UIViewController {

    enum Section: Int, CaseIterable {
        case habits
    }
    
    let shadowButton = UIColor(#colorLiteral(red: 0.2745098039, green: 0.4352941176, blue: 0.8745098039, alpha: 1))
    let habitsList = Habit.getHabits()
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Habit>?
    
    var layerHeight = CGFloat()
    var addButton: UIButton = {
        let button = UIButton()
        let image = UIImage.SymbolConfiguration(pointSize: 27, weight: .bold, scale: .large)
        button.setImage(UIImage(systemName: "plus", withConfiguration: image), for: .normal)
        button.imageView?.tintColor = .white
        button.backgroundColor = .mainColor()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        createDataSource()
        reloadData()
        setupNavigationBar()
        setupAddButton()

    }
    
    private func setupAddButton() {
        view.addSubview(addButton)
        let size = CGFloat(70)
        //        let constant: CGFloat = -20 + ( layerHeight / 2 ) - 5
        
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
    
    private func setupNavigationBar() {
        title = "Habits"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navigationBarAppearance = UINavigationBarAppearance()
        
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearance.backgroundColor = .backgroundColor()
        
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.tintColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "setting"),
            style: .done,
            target: self,
            action: #selector(settingButtonPressed)
        )
    }
    
    @objc func settingButtonPressed() {
        let settingVC = SettingsAppViewController()
        navigationController?.pushViewController(settingVC, animated: true)
    }
    
    @objc func addButtonPressed() {
        let addHabitVC = AddHabitViewController()
        navigationController?.pushViewController(addHabitVC, animated: true)
    }
}
    
    
// MARK: - UICollectionView
extension UserHabitsViewController {
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .backgroundColor()
        view.addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.register(UserHabitsCell.self, forCellWithReuseIdentifier: UserHabitsCell.reuseId)
    }
    
    private func configure<T: SelfConfiguringCell>(cellType: T.Type, with value: Habit, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")}
        cell.configure(with: value)
        return cell
    }
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Habit>(collectionView: collectionView, cellProvider: {
            (collectionView, indexPath, habit) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            
            switch section {
            case .habits:
                return self.configure(cellType: UserHabitsCell.self, with: habit, for: indexPath)
            }
        })
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Habit>()
        snapshot.appendSections([.habits])
        snapshot.appendItems(habitsList, toSection: .habits)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - Setup layout
extension UserHabitsViewController {
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 15
            section.contentInsets = NSDirectionalEdgeInsets.init(top: 20, leading: 20, bottom: 0, trailing: 20)
            return section
        }
        return layout
    }
}

// MARK: - SwiftUI
import SwiftUI

struct HabitVC: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let tabBar = TabBarController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<HabitVC.ContainerView>) -> TabBarController {
            return tabBar
        }

        func updateUIViewController(_ uiViewController: HabitVC.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<HabitVC.ContainerView>) {

        }
    }
}
