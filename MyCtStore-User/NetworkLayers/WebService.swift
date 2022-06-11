//
//  WebService.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 09/06/22.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class WebService: NSObject {
    func request(url: String,
                       method: HTTPMethod,
                       parameter: Parameters,
                       headers: HTTPHeaders,
                       success: @escaping (Data,Int,JSON) -> Void,
                       failure: @escaping (Error) -> Void) {
        Alamofire.request(url, method: method, parameters: parameter, headers: headers).responseJSON { (responseObject) -> Void in
            switch responseObject.result {
            case .success(_):
                success(responseObject.data!, responseObject.response?.statusCode ?? 0, JSON(responseObject.result.value!))
            case .failure(let error):
                let error: Error = error
                failure(error)
            }
        }
    }
}
