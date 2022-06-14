//
//  HomeViewModel.swift
//  MyCtStore-User
//
//  Created by Ishita Ginoya on 13/06/22.
//

import Foundation
import Alamofire
class HomeViewModel {
    
    private let categoryWebService: CategoryWebServiceProtocol
    init(categoryWebservice: CategoryWebServiceProtocol = CategoryWebService()) {
        self.categoryWebService = categoryWebservice
    }
    
    func request(completion:@escaping CategoryAPICompletion) {
        categoryWebService.category { result in
            switch result {
            case .success(let category): completion(.success(category))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
