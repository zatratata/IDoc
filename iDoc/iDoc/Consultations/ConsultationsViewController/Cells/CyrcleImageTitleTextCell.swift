//
//  CyrcleImageTitleTextCell.swift
//  iDoc
//
//  Created by Default User on 4/16/21.
//

import UIKit

final class CyrcleImageTitleTextCell: UITableViewCell {

    private let borderWidth: CGFloat = 1

    static let cellID = "CyrcleImageTitleTextCell"
    
        //MARK: - GUI
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var sideImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = Constants.smallCornerRadius
        containerView.layer.borderWidth = borderWidth
        containerView.layer.borderColor = Constants.lightThemeColor?.cgColor
        containerView.clipsToBounds = true
    }

    //MARK: - Methods
    func setupCell(with consultation: MenuCellModel) {
        self.titleLabel.text = consultation.title
        self.descriptionLabel.text = consultation.description
        if let image = UIImage(named: consultation.imageName) {
            self.sideImageView.image = image
        }
    }
}
