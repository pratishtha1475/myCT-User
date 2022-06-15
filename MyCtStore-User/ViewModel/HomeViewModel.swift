//
//  HomeViewModel.swift
//  MyCtStore-User
//
//  Created by Ishita Ginoya on 13/06/22.
//

import Foundation
import Alamofire
class HomeViewModel {
    var categoryArray: [Category] = []
    var bannerArray: [Banner] = []
    var itemArray: [ItemData] = []
    let webService = WebService()
    init() {
        
    }
    
    func getCategory(index: Int) -> Category { return categoryArray[index]}
    func getBanner(index: Int) -> Banner { return bannerArray[index]}
    
    func getResult(completion: @escaping (Bool, String) -> Void) {
        
        let parameter : Parameters = [
            "store_type" : "",
            "type" : "takeaway",
            "city_id" : "1",
            "area_id" : "4"
        ]
        
        webService.request(url: APIURLs.homePage, method: .post, parameter: parameter, headers: [:]) { responsedata, responseStatusCode, responseJSON in
            if responseStatusCode == 200 {
                let decoder = JSONDecoder()
                do {
                    let responseObject = try decoder.decode(HomePageAPIResponse.self, from: responsedata)
                    self.categoryArray = responseObject.storeType ?? []
                    self.bannerArray = responseObject.banner ?? []
                    self.itemArray = responseObject.data ?? []
                    if self.categoryArray.count != 0 {
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
    
    func getBannerResult(completion: @escaping (Bool, String) -> Void) {
        
        let parameter : Parameters = [
            "store_type" : "",
            "type" : "takeaway",
            "city_id" : "1",
            "area_id" : "4"
        ]
        
        webService.request(url: APIURLs.homePage, method: .post, parameter: parameter, headers: [:]) { responsedata, responseStatusCode, responseJSON in
            if responseStatusCode == 200 {
                let downloadedImage = UIImage(data: responsedata)
                let decoder = JSONDecoder()
                do {
                    let responseObject = try decoder.decode(HomePageAPIResponse.self, from: responsedata)
                    self.bannerArray = responseObject.banner ?? []
                    if self.bannerArray.count != 0 {
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
