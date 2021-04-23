//
//  TabBarController.swift
//  iDoc
//
//  Created by Default User on 4/23/21.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        tabBar.backgroundColor = Constants.lightThemeColor
        tabBar.unselectedItemTintColor = Constants.themeColor
        tabBar.tintColor = Constants.selectedItemColor
        self.setupViewControllers()
        self.selectedIndex = 0
    }
    
    private func setupViewControllers() {
        var controllers: [UIViewController] = []
        TabBarItemsModel.allCases.forEach {
            let navController = UINavigationController(rootViewController: $0.setupController())
            navController.isNavigationBarHidden = true
            controllers.append(navController)
        }
        self.viewControllers = controllers
    }
}
