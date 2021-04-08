//
//  StartScreenViewModel.swift
//  iDoc
//
//  Created by Default User on 4/7/21.
//

import UIKit


protocol StartScreenViewModelProtocol: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    var firstViewController: UIViewController { get }
    var viewControllersCount: Int { get }
    
    func viewDidLoad()
    func skipButtonPressed()
}

final class StartScreenViewModel: NSObject {
    
    private var _pages: [StartScreenViewController] = []
    
    private var currentPageIndex = 0 {
        didSet {
            view?.updatePageControll(with: currentPageIndex)
        }
    }
    
    weak var view: PagingEnabledView?
    
    //MARK: - Initialization
    override init() {
        let view1 = StartScreenViewController()
        view1.setupView(boldTitle: "300+",
                        normalTitle: "Лучших врачей со всей Беларуси",
                        imageName: "doctorImage")
        let view2 = StartScreenViewController()
        view2.setupView(boldTitle: "30+",
                        normalTitle: "Многопрофильных медицинских центров",
                        imageName: "medCenterImage")
        let view3 = StartScreenViewController()
        view3.setupView(boldTitle: "24/7",
                        normalTitle: "Круглосуточная консультация врача",
                        imageName: "prettyDocImage")
        self._pages = [view1, view2, view3]
        super.init()
    }
    
    //MARK: - Methods

}

//MARK: - OnboardingViewModelProtocol
extension StartScreenViewModel: StartScreenViewModelProtocol {
    
    func viewDidLoad() {
        view?.updatePageControll(with: currentPageIndex)
    }
    
    var viewControllersCount: Int {
        return _pages.count
    }
    
    func skipButtonPressed() {
        print("skip")
    }
    
    var firstViewController: UIViewController {
        return _pages.first ?? UIViewController()
    }
}

//MARK: - UIPageViewControllerDelegate/UIPageViewControllerDataSource
extension StartScreenViewModel {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let startScreenVC = viewController as? StartScreenViewController,
              let viewControllerIndex = _pages.firstIndex(of: startScreenVC) else { return nil }
        currentPageIndex = viewControllerIndex
        let nextIndex = viewControllerIndex + 1
        guard _pages.count != nextIndex, _pages.count > nextIndex else { return nil }
        
        return _pages[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let startScreenVC = viewController as? StartScreenViewController,
              let viewControllerIndex = _pages.firstIndex(of: startScreenVC) else { return nil }
        currentPageIndex = viewControllerIndex
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0, _pages.count > previousIndex else { return nil }
        
        return _pages[previousIndex]
    }
}
