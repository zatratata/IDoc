//
//  MenuControllers.swift
//  iDoc
//
//  Created by Default User on 4/9/21.
//

import UIKit

enum MenuControllers: CaseIterable {
    case chronicIllnesses
    case medicalOperations
    case allergies
    case hereditaryDiseases
    case injuries
    case survey
    
    //MARK: - Methods
    func controller() -> UIViewController {
        switch self {
        case .chronicIllnesses:
            return SurveyViewController()
        case .survey:
            return SurveyViewController()
        default:
            return SurveyViewController()
        }
    }
    
    func cellModel() -> CabinetCellModel {
        switch self {
        case .chronicIllnesses:
            return CabinetCellModel(imageName: "menWithMagnifier", title: "Хронические заболевания")
        case .medicalOperations:
            return CabinetCellModel(imageName: "heartSmall", title: "Перенесенные операции")
        case .allergies:
            return CabinetCellModel(imageName: "pills", title: "Аллергия на препараты")
        case .hereditaryDiseases:
            return CabinetCellModel(imageName: "genIcon", title: "Наследственные болезни")
        case .injuries:
            return CabinetCellModel(imageName: "kneePain", title: "Травмы")
        case .survey:
            return CabinetCellModel(imageName: "fingerBlood", title: "Обследования/анализы")
        }
    }
}
