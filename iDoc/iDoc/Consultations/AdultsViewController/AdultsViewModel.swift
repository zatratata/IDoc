//
//  AdultsViewModel.swift
//  iDoc
//
//  Created by Default User on 4/16/21.
//

import Foundation
import ViewPager_Swift

final class AdultsViewModel: NSObject {
    
    var pages = AdultsPages.allCases
    private var viewControllers: [UIViewController]
    
    override init() {
        let firstViewController = ReusableTableViewController()
        firstViewController.setup(with: Specializations.allCases)
        let secondViewController = ReusableTableViewController()
        secondViewController.setup(with: MedicalCenters.allCases)
        self.viewControllers = [firstViewController, secondViewController]
        super.init()
    }

}

//MARK: - Extensions
extension AdultsViewModel: ViewPagerDelegate {
    func willMoveToControllerAtIndex(index: Int) {
        
    }
    
    func didMoveToControllerAtIndex(index: Int) {
    }
}

extension AdultsViewModel: ViewPagerDataSource {
    func numberOfPages() -> Int {
        pages.count
    }
    
    func viewControllerAtPosition(position: Int) -> UIViewController {
        guard viewControllers.count > position else {
            return UIViewController()
        }
        return viewControllers[position]
    }
    
    func tabsForPages() -> [ViewPagerTab] {
        var pagesArray: [ViewPagerTab] = []
        self.pages.forEach {
            pagesArray.append(ViewPagerTab(title: $0.title, image: nil))
        }
        return pagesArray
    }
    
    func startViewPagerAtIndex() -> Int {
        0
    }
}
