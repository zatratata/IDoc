//
//  StartScreenPageViewController.swift
//  iDoc
//
//  Created by Default User on 4/8/21.
//

import UIKit
import SnapKit

protocol PagingEnabledView: AnyObject {
    func updatePageControll(with index: Int)
}

final class StartScreenPageViewController: UIPageViewController {
    
    //MARK: - Constants
    private let buttonFont: UIFont = .boldSystemFont(ofSize: 17)
    private let buttonSideInset: CGFloat = 40
    private let buttonHeight: CGFloat = 40
    private let bottomButtonInset: CGFloat = 80
    private let verticalOffset: CGFloat = 15
    
    private let viewModel = StartScreenViewModel()
    
    //MARK: - GUI
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.numberOfPages = viewModel.viewControllersCount
        control.currentPageIndicatorTintColor = Constants.themeColor
        control.tintColor = .lightGray
        control.isUserInteractionEnabled  = false
        return control
    }()
    
    private lazy var userButton: UIButton = {
        let button = UIButton()
        button.setTitle("Пользователь", for: .normal)
        button.backgroundColor = Constants.themeColor
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = buttonFont
        button.layer.cornerRadius = buttonHeight / 2
        button.addTarget(self, action: #selector(userButtonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var doctorButton: UIButton = {
        let button = UIButton()
        button.setTitle("Врач", for: .normal)
        button.backgroundColor = Constants.lightThemeColor
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = buttonFont
        button.layer.cornerRadius = buttonHeight / 2
        button.addTarget(self, action: #selector(userButtonTap), for: .touchUpInside)
        return button
    }()
    
//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.viewDidLoad()
        setupButtons()
        setupPageControl()
    }
    
    //MARK: - Initialization
    init() {
        super.init(transitionStyle: .scroll,
                   navigationOrientation: .horizontal,
                   options: [:])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setup() {
        view.backgroundColor = Constants.lightThemeColor
        setViewControllers([viewModel.firstViewController],
                           direction: .forward,
                           animated: true,
                           completion: nil)
        delegate = viewModel
        dataSource = viewModel
        viewModel.view = self
    }
    
    private func setupPageControl() {
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(userButton.snp.top).offset(-verticalOffset)
        }
    }
    
    private func setupButtons() {
        view.addSubview(doctorButton)
        doctorButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(bottomButtonInset)
            make.leading.trailing.equalToSuperview().inset(buttonSideInset)
            make.height.equalTo(buttonHeight)
        }
        
        view.addSubview(userButton)
        userButton.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(buttonSideInset)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(doctorButton.snp.top).offset(-verticalOffset)
        }
    }
    //MARK: - Actions
    @objc private func userButtonTap() {
        MainCoordinator.shared.coordinate(to: MainCoordinator.Target.menu)
    }
    
    @objc private func doctorButtonTap() {
        MainCoordinator.shared.coordinate(to: MainCoordinator.Target.menu)
    }
}

//MARK: - OnboardingViewProtocol
extension StartScreenPageViewController: PagingEnabledView {
    
    func updatePageControll(with index: Int) {
        pageControl.currentPage = index
    }
}
