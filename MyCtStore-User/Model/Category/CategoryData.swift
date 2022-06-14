//
//  CategoryData.swift
//  MyCtStore-User
//
//  Created by Ishita Ginoya on 13/06/22.
//

import Foundation
struct CategoryData: Codable {
    var id: String
    var type: String
    var image: String
    
    private enum CodingKeys: String, CodingKey {
        case id, type, image
    }
}
