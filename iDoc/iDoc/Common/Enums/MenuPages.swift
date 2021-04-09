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
    func tableModel() -> [MenuCellModel] {
        switch self {
        case .personalCabinet:
            return [MenuCellModel(imageName: "menWithMagnifier", title: "Хронические заболевания"),
            MenuCellModel(imageName: "heartSmall", title: "Перенесенные операции"),
            MenuCellModel(imageName: "pills", title: "Аллергия на препараты"),
            MenuCellModel(imageName: "genIcon", title: "Наследственные болезни"),
            MenuCellModel(imageName: "kneePain", title: "Травмы"),
            MenuCellModel(imageName: "fingerBlood", title: "Обследования/анализы")]
        }
    }
}
