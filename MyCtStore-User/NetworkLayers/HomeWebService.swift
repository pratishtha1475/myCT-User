//
//  HomeWebService.swift
//  MyCtStore-User
//
//  Created by Ishita Ginoya on 13/06/22.
//

import Foundation
import Alamofire



protocol HomeWebServiceProtocol {
    func getResult(with parameter: Parameters, completion: @escaping (Bool, String) -> Void)
}
final class HomeWebService: HomeWebServiceProtocol {
    func getResult(with parameter: Parameters, completion: @escaping (Bool, String) -> Void) {
        let webService = WebService()
        webService.request(url: "", method: .post, parameter: parameter, headers: [:]) { responsedata, responseStatusCode, responseJSON in
            if responseStatusCode == 200 {
                completion(true, "")
                let decoder = JSONDecoder()
                do {
                    let responseObject = try decoder.decode(HomePageAPIResponse.self, from: responsedata)
                    let result = responseObject.storeType
                    if result.count != 0 {
                        completion(true, "")
                    } else {
                        completion(false, "data not found")
                    }
                } catch {
                    completion(false, "unable to decode")
                }
            } else {
                completion(false, "something went wrong try again")
            }
        } failure: { error  in
            print(error.localizedDescription)
            completion(false, error.localizedDescription)
        }

    }
}



