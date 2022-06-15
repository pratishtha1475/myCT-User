//
//  APIURLs.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 10/06/22.
//

import Foundation
struct APIURLs {
    static let baseURL: String = "https://myct.store/Mobile_Services/user/v2/index.php"
    static let login: String = baseURL + "/customer_login"
    static let homePage: String = baseURL + "/homepage"
    static let category: String = baseURL + "/get_type_of_food"
}
