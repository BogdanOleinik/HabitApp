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
    
    let habitsList: [Habit] = [
        Habit(habitName: "Run", habitImage: UIImage(named: "picture")!),
        Habit(habitName: "Walk", habitImage: UIImage(named: "picture")!),
        Habit(habitName: "Drink", habitImage: UIImage(named: "picture")!),
        Habit(habitName: "Swim", habitImage: UIImage(named: "picture")!),
        Habit(habitName: "Sleep", habitImage: UIImage(named: "picture")!),
    ]
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Habit>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        createDataSource()
        reloadData()
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        
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
            section.interGroupSpacing = 20
            section.contentInsets = NSDirectionalEdgeInsets.init(top: 20, leading: 24, bottom: 0, trailing: 24)
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
