//
//  LoginAPIResponce.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 10/06/22.
//

import Foundation

class LoginModel : NSObject, NSCoding {

    var id : Int!
    var email : String!
    var firstName : String!
    var lastname : String!
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        id = dictionary["id"] as? Int
        email = dictionary["email"] as? String
        firstName = dictionary["firstname"] as? String
        lastname = dictionary["lastname"] as? String
    }
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if id != nil{
            dictionary["id"] = id
        }
        if email != nil{
            dictionary["email"] = email
        }
        if firstName != nil{
            dictionary["firstname"] = firstName
        }
        if lastname != nil{
            dictionary["lastname"] = lastname
        }
        return dictionary
    }
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        id = aDecoder.decodeObject(forKey: "id") as? Int
        email = aDecoder.decodeObject(forKey: "email") as? String
        firstName = aDecoder.decodeObject(forKey: "firstname") as? String
        lastname = aDecoder.decodeObject(forKey: "lastname") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder) {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if firstName != nil{
            aCoder.encode(firstName, forKey: "firstname")
        }
        if lastname != nil{
            aCoder.encode(lastname, forKey: "lastname")
        }
    }
}

