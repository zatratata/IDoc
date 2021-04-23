//
//  MedicalCenters.swift
//  iDoc
//
//  Created by Default User on 4/16/21.
//

import Foundation

enum MedicalCenters: CaseIterable, MenuCellModel {
    case lode
    case kravira
    case nordin
    case eksana
    case medAvenu
    
    var imageName: String {
        switch self {
        case .lode:
            return "lodeIcon"
        case .kravira:
            return "kraviraIcon"
        case .nordin:
            return "nordinIcon"
        case .eksana:
            return "eksanaIcon"
        case .medAvenu:
            return "medAvenuIcon"
        }
    }
    
    var title: String {
        switch self {
        case .lode:
            return "МЦ \"Лодэ\""
        case .kravira:
            return "МЦ \"Кравира\""
        case .nordin:
            return "МЦ \"Нордин\""
        case .eksana:
            return "МЦ \"Эксана\""
        case .medAvenu:
            return "МЦ \"МедАвеню\""
        }
    }
    
    var description: String {
        switch self {
        case .lode:
            return "Многофункцианальный медицинский центр"
        case .kravira:
            return "Медцентр для детей и взрослых"
        case .nordin:
            return "Частный медицинский центр"
        case .eksana:
            return "Высококлассные специалисты"
        case .medAvenu:
            return "Широкий профиль опытных врачей"
        }
    }
}
