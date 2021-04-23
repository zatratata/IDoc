//
//  AdultsViewController.swift
//  iDoc
//
//  Created by Default User on 4/16/21.
//

import UIKit
import ViewPager_Swift

final class AdultsViewController: UIViewController {
    
    @IBOutlet weak var navBarContainerView: UIView!
    private let viewPagerBarHeight: CGFloat = 30
    private let viewModel = AdultsViewModel()
    
    //MARK: - GUI
    @IBOutlet weak var containerView: UIView!
   
    private lazy var viewPager: ViewPager = {
        let options = ViewPagerOptions()
        options.tabViewBackgroundDefaultColor = Constants.backgroundColor ?? UIColor.white
        options.tabViewTextDefaultColor = Constants.themeColor ?? UIColor.lightGray
        options.tabViewTextHighlightColor = Constants.lightThemeColor ?? UIColor.darkText
        options.tabViewHeight = viewPagerBarHeight
        options.isTabBarShadowAvailable = false
        options.tabIndicatorViewBackgroundColor = Constants.selectedItemColor ?? .yellow
        options.tabViewBackgroundHighlightColor = Constants.backgroundColor ?? UIColor.white
        options.distribution = .segmented
        let pager = ViewPager(viewController: self, containerView: self.containerView)
        pager.setOptions(options: options)
        pager.setDelegate(delegate: viewModel)
        pager.setDataSource(dataSource: viewModel)
        return pager
    }()

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        let navBar = CustomNavigationBar.view()
        navBar?.navigationController = navigationController
        navBarContainerView.addSubview(navBar ?? UIView())
        navBar?.snp.makeConstraints({ (make) in
            make.edges.equalToSuperview()
        })
        viewPager.build()
    }
}


