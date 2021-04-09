//
//  TableViewWithoutScroll.swift
//  iDoc
//
//  Created by Default User on 4/8/21.
//

import UIKit

final class TableViewWithoutScroll: UITableView {
    
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
