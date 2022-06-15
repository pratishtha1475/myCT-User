//
//  Banner.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 14/06/22.
//

import Foundation
struct Banner: Codable {
    var fileName: String?
    
    private enum CodingKeys: String, CodingKey {
        case fileName = "filename"
    }
}
