//
//  LoginWebService.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 10/06/22.
//

import Foundation
import Alamofire

typealias LoginAPICompletion = ( (Swift.Result<LoginModel, Swift.Error>) -> Void)

protocol LoginWebServiceProtocol {
    func login(with parameter: Parameters, completion: @escaping LoginAPICompletion)
}

final class LoginWebService: LoginWebServiceProtocol {
    func login(with parameter: Parameters, completion: @escaping LoginAPICompletion) {
        let webService = WebService()
        webService.request(url: APIURLs.login, method: .post, parameter: parameter, headers: [:]) { data, statusCode, responceObject in
            guard let responceDic = responceObject.object as? Dictionary<String, Any> else {
                completion(.failure(APIError.unknown))
                return
            }
            completion(.success(LoginModel(fromDictionary: responceDic)))
        } failure: { error in
            print(error.localizedDescription)
            completion(.failure(error))
        }
    }
}

enum APIError: LocalizedError, Equatable {
    case unknown
    case couldNotParseJson
}
