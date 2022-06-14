//
//  CategoryWebService.swift
//  MyCtStore-User
//
//  Created by Ishita Ginoya on 13/06/22.
//

import Foundation

typealias CategoryAPICompletion = ( (Swift.Result<Category, Swift.Error>) -> Void)

protocol CategoryWebServiceProtocol {
    func category(completion:@escaping CategoryAPICompletion ) 
}

final class CategoryWebService: CategoryWebServiceProtocol {
    func category(completion: @escaping CategoryAPICompletion) {
        let webService = WebService()
        webService.request(url: APIURLs.category, method: .get, parameter: [:], headers: [:]) { responseData, responseStatusCode, responseObject in
            print(responseObject.object)
            guard let responseDisc = responseObject.object as? NSDictionary else {
                completion(.failure(APIError.unknown))
                    return
            }
            print(responseDisc)
            completion(.success(try! Category(from: responseDisc as! Decoder)))
        } failure: { error in
            print(error.localizedDescription)
            completion(.failure(error))
        }
    }
}
