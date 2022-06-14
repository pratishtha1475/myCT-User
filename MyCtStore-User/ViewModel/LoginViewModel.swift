//
//  LoginViewModel.swift
//  MyCtStore-User
//
//  Created by Pratishtha Ginoya on 10/06/22.
//

import Foundation
import Alamofire
class LoginViewModel {
    
    private let loginWebService: LoginWebServiceProtocol
    
    
    init(loginWebService: LoginWebServiceProtocol = LoginWebService()) {
        self.loginWebService = loginWebService
        
    }
    
    func login(email: String, password: String, completion: @escaping LoginAPICompletion) {
        let parameters: Dictionary = [
            "email"         :  email.trimmed,
            "password"      :  password.trimmed.removeSingleDoubleQuotes(),
            "device_type"   : "ios",
            "token"         : "66366F8D72F630F9D1DBB0BC29C2540B46BAAE7990D5B25F08B0600EFF8F0191",
            "version_code"  : "1.1.3",
            "version_name"  : "1.0"
        ]
        
        loginWebService.login(with: parameters) { result in
            switch result {
            case .success(let loginDetails): completion(.success(loginDetails))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
    
    func validate(email: String, password: String) -> ValidationResult {
        if email.isEmpty {
            return ValidationResult(isValid: false, message: Strings.kEmailBlankMessage)
        } else if !Utils.isValidEmailAddress(email: email.trimed) {
            return ValidationResult(isValid: false, message: Strings.kInvalidEmailMessage)
        } else if password.isEmpty {
            return ValidationResult(isValid: false, message: Strings.kPasswordBlankMessage)
        } else if !Utils.isPasswordLenght(password: password.trimed) {
            return ValidationResult(isValid: false, message: Strings.kPasswordLengthMessage)
        }
        return ValidationResult(isValid: true, message: "")
    }
    
    func isEmailValidate(enteredEmail: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
    
    func isPasswordValidate(password: String) -> Bool {
        let passwordFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordFormat)
        return passwordPredicate.evaluate(with: password)
    }
}
