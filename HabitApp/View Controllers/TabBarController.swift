//
//  TabBarControllerViewController.swift
//  HabitApp
//
//  Created by Олейник Богдан on 30.05.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let habitViewController = HabitViewController()
        let settingViewController = SettingViewController()
        
        tabBar.tintColor = #colorLiteral(red: 0.5184966326, green: 0.5887500048, blue: 1, alpha: 1)
        let boldConfiguration = UIImage.SymbolConfiguration(weight: .bold)
        let habitImage = UIImage(systemName: "plus.circle.fill", withConfiguration: boldConfiguration)!
        let settingImage = UIImage(systemName: "paperplane.fill", withConfiguration: boldConfiguration)!
        
        viewControllers = [
            generateNavigationController(rootViewController: habitViewController, title: "Habits", image: habitImage),
            generateNavigationController(rootViewController: settingViewController, title: "Setting", image: settingImage)
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }

    

}
