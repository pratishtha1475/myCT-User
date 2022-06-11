//
//  Utils.swift
//  MyCtStore-User
//
//  Created by Ishita Ginoya on 09/06/22.
//

import Foundation

class Utils: NSObject {
    class func isValidEmailAddress(email: String) -> Bool {
        let emailRegx = kEmailAddressRegx
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegx)
        return emailTest.evaluate(with: email)
    }
    
    class func isValidPhoneNumber(phoneNumber: String) -> Bool {
        let phoneNumberRegx = kPhoneNumberRegx
        let phoneNumberTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegx)
        return phoneNumberTest.evaluate(with: phoneNumber)
    }
    
    class func isValidString(string: String) -> Bool {
        if (string.length == 0) { return false }
        return true
    }
    
    class func isPasswordSame(password: String , confirmPassword : String) -> Bool {
        if password == confirmPassword { return true } else { return false }
    }
    
    class func isPasswordLenght(password: String ) -> Bool {
        if password.length >= kPasswordlength { return true } else { return false }
    }
    
    class func isPasswordValid(_ password : String) -> Bool {
        let passwordRegx = kPasswordRegex
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegx)
        return passwordTest.evaluate(with: password)
    }
    
    class func setRootViewController() {
        if #available(iOS 13.0, *) {
            let tabbarViewController = Config.storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
            SceneDelegate.shared?.window?.rootViewController = tabbarViewController
            SceneDelegate.shared?.window?.makeKeyAndVisible()
        } else {
            let tabbarViewController = Config.storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
            AppDelegate.appDelegate?.window?.rootViewController = tabbarViewController
            AppDelegate.appDelegate?.window?.makeKeyAndVisible()
        }
    }
    
    class func setALert(title: String?, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        return alert
    }
}
