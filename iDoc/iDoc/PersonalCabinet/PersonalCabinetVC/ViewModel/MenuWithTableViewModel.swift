//
//  MenuWithTableViewModel.swift
//  iDoc
//
//  Created by Default User on 4/8/21.
//

import UIKit
import RxSwift

final class MenuWithTableViewModel: NSObject {
    
    var tableModel = PublishSubject<[MenuControllers]>()
    
    //MARK: - Methods
    func setupTable(page: MenuPages) {
        tableModel.onNext(page.tableModel())
    }
}
