//
//  TabBarItemsModel.swift
//  iDoc
//
//  Created by Default User on 4/23/21.
//

import UIKit

enum TabBarItemsModel: CaseIterable {
    
    case consultations
    case technicalSupport
    case personalCabinet
    
    private var tabBarItem: UITabBarItem {
        switch self {
        case .consultations:
            let item = UITabBarItem(title: NSLocalizedString("Консультации", comment: ""),
                                    image: UIImage(named: "consultationsBarIcon"),
                                    selectedImage: UIImage(named: "consultationsBarIcon"))
            return item
        case .technicalSupport:
            let item = UITabBarItem(title: NSLocalizedString("Техподдержка", comment: ""),
                                    image: UIImage(named: "techSupportBarIcon"),
                                    selectedImage: UIImage(named: "techSupportBarIcon"))
            return item
        case .personalCabinet:
            let item = UITabBarItem(title: NSLocalizedString("Личный Кабинет", comment: ""),
                                    image: UIImage(named: "personalCabinetBarIcon"),
                                    selectedImage: UIImage(named: "personalCabinetBarIcon"))
            return item
        }
    }
    
    func setupController() -> UIViewController {
        switch self {
        case .consultations:
            let viewController = ConsultationsViewController()
            viewController.tabBarItem = self.tabBarItem
            return viewController
        case .technicalSupport:
            let viewController = PersonalCabinetViewController()
            viewController.tabBarItem = self.tabBarItem
            return viewController
        case .personalCabinet:
            let viewController = PersonalCabinetViewController()
            viewController.tabBarItem = self.tabBarItem
            return viewController
        }
    }
}
