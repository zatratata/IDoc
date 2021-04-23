//
//  CustomNavigationBar.swift
//  iDoc
//
//  Created by Default User on 4/22/21.
//

import UIKit

final class CustomNavigationBar: UIView {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var navigationController: UINavigationController?
    
    var isRootViewController = false {
        willSet {
            if newValue {
                self.backButton.isHidden = true
            }
        }
    }
    
    //MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        backButton.imageView?.contentMode = .scaleToFill
    }
    
    class func view() -> CustomNavigationBar? {
        let nib = Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)
        return nib?.first as? CustomNavigationBar
    }
    
    //MARK: - Actions
    @IBAction func backButtonTap(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
