//
//  HomePageAPIResponse.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 14/06/22.
//

import Foundation
struct HomePageAPIResponse: Codable {
    var error: Bool?
    var storeType: [Category]
    var data: [ItemData]
    var banner: [Banner]
    var storesNumber: Int?
    
    private enum CodingKeys: String, CodingKey {
        case error
        case storeType = "store_type"
        case data, banner
        case storesNumber = "num_stores"
    }
}
