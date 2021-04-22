//
//  ImageLabelArrowCell.swift
//  iDoc
//
//  Created by Default User on 4/8/21.
//

import UIKit

final class ImageLabelArrowCell: UITableViewCell {
    
    static let cellID = "ImageLabelArrowCell"
    
    private let borderWidth: CGFloat = 1
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var convenientImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    
//MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = Constants.smallCornerRadius
        containerView.layer.borderWidth = borderWidth
        containerView.layer.borderColor = Constants.cellBorderColor?.cgColor
    }
    
    //MARK: - Methods
    func setupCell(with model: CabinetCellModel) {
        self.titleLabel.text = model.title
        if let image = UIImage(named: model.imageName) {
            convenientImageView.image = image
        }
    }
}
