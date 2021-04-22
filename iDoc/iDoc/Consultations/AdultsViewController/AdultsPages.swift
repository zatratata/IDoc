//
//  AdultsPages.swift
//  iDoc
//
//  Created by Default User on 4/16/21.
//

import Foundation

enum AdultsPages: CaseIterable {
    case specializations
    case medicalCenters
    
    var title: String {
        switch self {
        case .specializations:
            return "Специализации"
        case .medicalCenters:
            return "Медцентры"
        }
    }
    
    var tableModel: [MenuCellModel] {
        switch self {
        case .specializations:
            return Specializations.allCases
        case .medicalCenters:
            return MedicalCenters.allCases
        }
    }
}
