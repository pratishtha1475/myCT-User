//
//  Category.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 14/06/22.
//

import Foundation
struct Category: Codable {
    var id: String?
    var type: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case type
    }
}
