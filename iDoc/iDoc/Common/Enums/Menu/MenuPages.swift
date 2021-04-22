//
//  MenuPages.swift
//  iDoc
//
//  Created by Default User on 4/9/21.
//

import Foundation

enum MenuPages {
    case personalCabinet
    
    //MARK: - Methods
    func tableModel() -> [MenuControllers] {
        switch self {
        case .personalCabinet:
            return [.chronicIllnesses,
                    .medicalOperations,
                    .allergies,
                    .hereditaryDiseases,
                    .injuries,
                    .survey]
        }
    }
}
