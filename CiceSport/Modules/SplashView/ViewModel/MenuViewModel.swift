//
//  MenuViewModel.swift
//  CiceSport
//
//  Created by cice on 04/07/2021.
//

import Foundation

// MARK: - ResponseMenuModel
struct MenuViewModel: Codable {
    
    let menuResponse: [MenuResponse]?

    init(businessModel: ResponseMenuModel) {
        self.menuResponse = businessModel.menuResponse
    }

}

