//
//  AdultsViewController.swift
//  iDoc
//
//  Created by Default User on 4/16/21.
//

import UIKit
import ViewPager_Swift

final class AdultsViewController: UIViewController {
    
    private var viewModel = AdultsViewModel()
    
    //MARK: - GUI
    @IBOutlet weak var containerView: UIView!
   
    private lazy var viewPager: ViewPager = {
        let options = ViewPagerOptions()
        options.tabViewBackgroundDefaultColor = Constants.backgroundColor ?? UIColor.white
        options.tabViewTextDefaultColor = UIColor(named: "UnselectedLineColor") ?? UIColor.lightGray
        options.tabViewTextHighlightColor = Constants.themeColor ?? UIColor.darkText
        options.isTabBarShadowAvailable = false
        options.tabViewBackgroundHighlightColor = Constants.lightThemeColor ?? UIColor.white
        let pager = ViewPager(viewController: self, containerView: self.containerView)
        pager.setOptions(options: options)
        pager.setDelegate(delegate: viewModel)
        pager.setDataSource(dataSource: viewModel)
        return pager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewPager.build()
    }
}


