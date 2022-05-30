//
//  HabitViewController.swift
//  HabitApp
//
//  Created by Олейник Богдан on 30.05.2022.
//

import UIKit
import SwiftUI

struct Habit: Hashable {
    var habitName: String
    var habitImage: UIImage
    var habitCount: Int
//    var id = UUID()
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//
//    static func == (lhs: Habit, rhs: Habit) -> Bool {
//        return lhs.id == rhs.id
//    }
}

class HabitViewController: UIViewController {

    enum Section: Int, CaseIterable {
        case habits
    }
    
    let addButton = AddButton()
    
    let habitsList: [Habit] = [
        Habit(habitName: "Run", habitImage: UIImage(named: "picture")!, habitCount: 20),
        Habit(habitName: "Walk", habitImage: UIImage(named: "picture")!, habitCount: 6),
        Habit(habitName: "Drink", habitImage: UIImage(named: "picture")!, habitCount: 43),
        Habit(habitName: "Swim", habitImage: UIImage(named: "picture")!, habitCount: 0),
        Habit(habitName: "Sleep", habitImage: UIImage(named: "picture")!, habitCount: 9),
        Habit(habitName: "Swim", habitImage: UIImage(named: "picture")!, habitCount: 7),
        Habit(habitName: "Sleep", habitImage: UIImage(named: "picture")!, habitCount: 12),
        Habit(habitName: "Dance", habitImage: UIImage(named: "picture")!, habitCount: 18)
    ]
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Habit>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        createDataSource()
        reloadData()
        setupConstraints()
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.register(HabitCollectionCell.self, forCellWithReuseIdentifier: HabitCollectionCell.reuseId)
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
                return self.configure(cellType: HabitCollectionCell.self, with: habit, for: indexPath)
            }
        })
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Habit>()
        snapshot.appendSections([.habits])
        snapshot.appendItems(habitsList, toSection: .habits)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 15
            section.contentInsets = NSDirectionalEdgeInsets.init(top: 20, leading: 24, bottom: 0, trailing: 24)
            return section
        }
        return layout
    }
    
    private func setupConstraints() {
        
        view.addSubview(addButton)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
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
