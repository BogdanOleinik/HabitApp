//
//  TabBarControllerViewController.swift
//  HabitApp
//
//  Created by Олейник Богдан on 30.05.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    let barBackgroundColor = UIColor(#colorLiteral(red: 0.2039215686, green: 0.2039215686, blue: 0.2039215686, alpha: 1))
    let disableButtonColor = UIColor(#colorLiteral(red: 0.702490747, green: 0.7417221665, blue: 0.7156566978, alpha: 1))
    let shadowViewColor = UIColor(#colorLiteral(red: 0.2484094203, green: 0.2484094203, blue: 0.2484094203, alpha: 1))

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
        
    }
    
    private func setupTabBar() {
        let habitViewController = UserHabitsViewController()
        let settingViewController = UserTasksViewController()

        tabBar.tintColor = #colorLiteral(red: 0.2429549098, green: 0.4184055924, blue: 0.8786335588, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 0.06782443076, green: 0.07631989568, blue: 0.0978892222, alpha: 1)
        let boldConfiguration = UIImage.SymbolConfiguration(pointSize: 20, weight: .heavy)
        let habitImage = UIImage(systemName: "plus.circle.fill", withConfiguration: boldConfiguration)!
        let settingImage = UIImage(systemName: "paperplane.fill", withConfiguration: boldConfiguration)!

        viewControllers = [
            generateNavigationController(rootViewController: settingViewController, title: "Setting", image: settingImage),
            generateNavigationController(rootViewController: habitViewController, title: "Habits", image: habitImage)
        ]
        
//        viewControllers?.compactMap({ $0 as? UINavigationController }).compactMap({ $0.viewControllers.first }).forEach({
//            let inset: CGFloat = view.safeAreaInsets.bottom == 0 ? 4.0 : 10.0
//                    $0.tabBarItem.imageInsets = UIEdgeInsets(top: inset, left: 0.0, bottom: -inset, right: 0.0)
//                    $0.loadViewIfNeeded()
//                })

    }

    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tabBar.barTintColor = UIColor(red: 38.255, green: 196/255, blue: 133/255, alpha: 1)
//        setupTabBar()
//    }
//
//    func setupTabBar() {
//
//        let habitController = UINavigationController(rootViewController: HabitViewController())
//        habitController.tabBarItem.image = UIImage(named: "Habit")
//        habitController.tabBarItem.selectedImage = UIImage(systemName: "plus.circle.fill")
//
//        let settingController = UINavigationController(rootViewController: SettingViewController())
//        settingController.tabBarItem.image = UIImage(named: "Habit")
//        settingController.tabBarItem.selectedImage = UIImage(named: "setting")
//
//        viewControllers = [habitController, settingController]
//    }
//
}

// MARK: - SwiftUI
import SwiftUI

struct TabBar: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let tabBar = TabBarController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<TabBar.ContainerView>) -> TabBarController {
            return tabBar
        }

        func updateUIViewController(_ uiViewController: TabBar.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<TabBar.ContainerView>) {

        }
    }
}
