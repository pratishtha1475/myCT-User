//
//  Category.swift
//  MyCtStore-User
//
//  Created by Ishita Ginoya on 13/06/22.
//

import Foundation
struct Category: Codable {
    var error: Bool
    var data: [CategoryData]
    
    private enum CodingKeys: String, CodingKey {
        case error, data
    }
}
