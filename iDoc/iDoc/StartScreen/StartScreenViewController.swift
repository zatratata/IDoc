//
//  StartScreenViewController.swift
//  iDoc
//
//  Created by Default User on 4/7/21.
//

import UIKit
import SnapKit

final class StartScreenViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var boldTitleLabel: UILabel!
    @IBOutlet weak var normalWeightTitleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    private var boldTitle: String?
    private var normalTitle: String?
    private var imageName: String?
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGUI()
    }
    
    //MARK: - Methods
    func setupView(boldTitle: String,
                   normalTitle: String,
                   imageName: String) {
        self.boldTitle = boldTitle
        self.normalTitle = normalTitle
        self.imageName = imageName
    }
    
    private func setupGUI() {
        boldTitleLabel.text = boldTitle
        normalWeightTitleLabel.text = normalTitle
        if let image = UIImage(named: imageName ?? "") {
            backgroundImageView.image = image
        }
    }
}
