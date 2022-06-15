//
//  Data.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 14/06/22.
//

import Foundation
struct ItemData: Codable {
    var itemName: String?
    var deliveryCharges: String?
    var id: String?
    var image: String?
    var isOpen: String?
    var rating: String?
    var minimumOrder: String?
    
    private enum CodingKeys: String, CodingKey {
        case itemName = "business_name"
        case deliveryCharges = "delivery_charges"
        case id, image
        case isOpen = "isopen"
        case rating
        case minimumOrder = "min_order"
    }
}
