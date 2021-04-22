//
//  Specializations.swift
//  iDoc
//
//  Created by Default User on 4/16/21.
//

import Foundation

enum Specializations: CaseIterable, MenuCellModel {
    case therapeutist
    case cardiologist
    case ophthalmologist
    case neurologist
    case durmatologist
    
    var imageName: String {
        switch self {
        case .therapeutist:
            return "therapeutistIcon"
        case .cardiologist:
            return "cardiologistIcon"
        case .ophthalmologist:
            return "ophthalmologistIcon"
        case .neurologist:
            return "neurologistIcon"
        case .durmatologist:
            return "durmatologistIcon"
        }
    }
    
    var title: String {
        switch self {
        case .therapeutist:
            return "Терапевт"
        case .cardiologist:
            return "Кардиолог"
        case .ophthalmologist:
            return "Офтальмолог"
        case .neurologist:
            return "Невролог"
        case .durmatologist:
            return "Дерматолог"
        }
    }
    
    var description: String {
        switch self {
        case .therapeutist:
            return "Заболевания общего профиля"
        case .cardiologist:
            return "Болезни сердца и сосудов"
        case .ophthalmologist:
            return "Болезни глаз"
        case .neurologist:
            return "Проблемы нарвной системы"
        case .durmatologist:
            return "Болезни кожи"
        }
    }
}
