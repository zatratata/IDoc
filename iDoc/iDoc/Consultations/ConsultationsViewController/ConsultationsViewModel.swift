//
//  ConsultationsViewModel.swift
//  iDoc
//
//  Created by Default User on 4/16/21.
//

import Foundation
import RxSwift
import RxDataSources
import RxCocoa

final class ConsultationViewModel {
    
    struct SectionModel: SectionModelType {
        typealias Item = MenuCellModel
        var items: [MenuCellModel]
    }
    
    private enum CellOptions {
        case menu
        case search(String)
        }
    
    //MARK: - Private properties
    private var menuModel = BehaviorRelay<[MenuCellModel]>(value: ConsultationCategories.allCases)
    private var searchResultModel = BehaviorRelay<[MenuCellModel]>(value: Specializations.allCases)
    
    //MARK: - Lazy propeties
    private lazy var modelState = BehaviorRelay<CellOptions>(value: .menu)
    
    lazy var queryChanged = Binder<String?>(self) { viewModel, query in
        guard let text = query, !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            viewModel.modelState.accept(.menu)
            return
        }
        viewModel.modelState.accept(.search(text))
    }
    
    //MARK: - Properties
    var items: Driver<[SectionModel]> {
        return Observable.combineLatest(modelState, menuModel, searchResultModel) {
            (state, menu, search) in
            switch state {
            case .menu:
                let sectionModel = SectionModel(items: menu.map { $0 } )
                return [sectionModel]
            case .search(let text):
                let sectionModel = SectionModel(items: search.filter {
                    $0.title.lowercased().contains(text.lowercased())
                } )
                return [sectionModel]
            }
        }.asDriver(onErrorJustReturn: [SectionModel(items: ConsultationCategories.allCases)])
    }
}

//MARK: - Extensions
extension ConsultationViewModel.SectionModel {
    init(original: ConsultationViewModel.SectionModel, items: [MenuCellModel]) {
        self.items = items
    }
}
