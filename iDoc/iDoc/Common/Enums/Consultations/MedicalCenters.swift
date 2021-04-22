//
//  MedicalCenters.swift
//  iDoc
//
//  Created by Default User on 4/16/21.
//

import Foundation

enum MedicalCenters: CaseIterable, MenuCellModel {
    case first
    
    var imageName: String {
        switch self {
        case .first:
            return "therapeutistIcon"
        }
    }
    
    var title: String {
        switch self {
        case .first:
            return "Терапевт"
            
        }
    }
    
    var description: String {
        switch self {
        case .first:
            return "Заболевания общего профиля"
        }
    }
}
