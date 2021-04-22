//
//  ConsultationCategories.swift
//  iDoc
//
//  Created by Default User on 4/16/21.
//

import Foundation

enum ConsultationCategories: CaseIterable, MenuCellModel {
    case adults
    case children
    case doctorOnDuty
    case discounts
    
    var imageName: String {
        switch self {
        case .adults:
            return "adultsIcon"
        case .children:
            return "kidsIcon"
        case .doctorOnDuty:
            return "dutyDoctorIcon"
        case .discounts:
            return "discountsIcon"
        }
    }
    
    var title: String {
        switch self {
        case .adults:
            return "Взрослые"
        case .children:
            return "Дети"
        case .doctorOnDuty:
            return "Дежурный доктор"
        case .discounts:
            return "Скидки/Акции"
        }
    }
    
    var description: String {
        switch self {
        case .adults:
            return "Консультации по заболеваниям взрослого и пожилого населения"
        case .children:
            return "Консультации врачей, специализирующихся на детских заболеваниях"
        case .doctorOnDuty:
            return "Круглосуточная консультация врачей различных направлений"
        case .discounts:
            return "Выгодные предложения по консультациям на постоянной основе"
        }
    }
}
