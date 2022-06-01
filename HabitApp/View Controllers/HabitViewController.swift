//
//  HabitViewController.swift
//  HabitApp
//
//  Created by Олейник Богдан on 30.05.2022.
//

import UIKit
import SwiftUI

class HabitViewController: UIViewController {

    enum Section: Int, CaseIterable {
        case habits
    }
    
    let shadowButton = UIColor(#colorLiteral(red: 0.2745098039, green: 0.4352941176, blue: 0.8745098039, alpha: 1))
    let habitsList = Habit.getHabits()
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Habit>?
    
    var layerHeight = CGFloat()
    var middleButton: UIButton = {
       let button = UIButton()
       let image = UIImage.SymbolConfiguration(pointSize: 20, weight: .heavy, scale: .large)
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
        addMiddleButton()
    }
    
    func addMiddleButton() {
        view.addSubview(middleButton)
        let size = CGFloat(80)
        let constant: CGFloat = -20 + ( layerHeight / 2 ) - 5
        
        NSLayoutConstraint.activate([
                middleButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
                middleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                middleButton.heightAnchor.constraint(equalToConstant: size),
                middleButton.widthAnchor.constraint(equalToConstant: size)
        ])
        
        middleButton.layer.cornerRadius = size / 2
            
        middleButton.layer.shadowColor = shadowButton.cgColor
            middleButton.layer.shadowOffset = CGSize(width: 0,
                                                     height: 8)
            middleButton.layer.shadowOpacity = 0.75
            middleButton.layer.shadowRadius = 13
            
        middleButton.layer.masksToBounds = false
        middleButton.translatesAutoresizingMaskIntoConstraints = false
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
            action: nil
        )
        
////        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
////        navigationController?.navigationBar.shadowImage = UIImage()
//
//        navigationBarAppearance.backgroundColor = .backgroundColor()
//        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//
//
//        navigationController?.navigationBar.tintColor = .white
//        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
//        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
//
////        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//
////        navigationController?.navigationBar.barStyle = .black
//
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            image: UIImage(named: "setting"),
//            style: .done,
//            target: self,
//            action: nil)
//    }
//
//    @objc private func settingButton() {
//        let settingVC = SettingViewController()
//        navigationController?.pushViewController(settingVC, animated: true)
    }
    
}
    
    
// MARK: - UICollectionView
extension HabitViewController {
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .backgroundColor()
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
}

// MARK: - Setup layout
extension HabitViewController {
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
