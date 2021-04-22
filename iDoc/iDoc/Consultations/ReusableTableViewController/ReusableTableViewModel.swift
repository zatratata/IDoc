//
//  ReusableTableViewModel.swift
//  iDoc
//
//  Created by Default User on 4/16/21.
//

import Foundation
import RxSwift

final class ReusableTableViewModel {
    
    var tableModel = BehaviorSubject<[MenuCellModel]>(value: [])
    
    //MARK: Initialization
    init(model: [MenuCellModel]) {
        self.tableModel.onNext(model)
    }
}
