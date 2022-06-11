//
//  Strings.swift
//  MyCtStore-User
//
//  Created by Ishita Ginoya on 09/06/22.
//

import Foundation
var kPasswordlength = 6
var kPhoneNumberRegx = "^+(?:[0-9] ?){6,14}[0-9]$"
var kEmailAddressRegx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
var kPostalcodeRegxCanada = "(^[a-zA-Z][0-9][a-zA-Z][- ]*[0-9][a-zA-Z][0-9]$)"
var kPasswordRegex = "^(?=.*[A-Z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,15}"
var kPhoneNumberRegx_speeddial = "^+(?:[0-9] ?){6,14}[0-9]$"

struct Strings {
    //MARK: - LoginWithEmailVC
    static let kPrivacyPolicy = "Privacy Policy"
    static let kTerms = "Terms & Conditions"
    static let kLoginSuccessfully = "Logged in successfully"
    static let kInvalidusernamePass = "Invalid Username/Password"
    static let kTermsandcondition = "Please accept our terms & conditions"
    
    //MARK: - registration
    static let kLogin = "Login"
    static let kHaveAccount = "Already have an account? "
    static let kFirstNameBlankMessage = "Please enter first name"
    static let kEmailBlankMessage = "Please enter email"
    static let kInvalidEmailMessage = "Please enter valid email"
    static let kPhonenumberBlankMessage = "Please enter phone number"
    static let kInvalidPhonenumber = "Please enter valid phone number"
    static let kPasswordBlankMessage = "Please enter password"
    static let kPasswordLengthMessage = "Password must be at least 6 characters long"
    static let kCurrentPasswordBlankMessage = "Please enter current password"
    static let kPasswordConfirmPasswordnotMatchkMessage = "Password and Confirm Password should be same"
    static let kRegisteredSuccessfully = "Registered successfully"
    static let kErrorwhileregister = "Error while registering"
    static let kUserRegisteredAndVerified = "You are already registered, please try login"
    static let kUserRegisteredAndNotVerified = "You are already registered, please verify your number."
}

extension String {
    var trimed: String {
        return String(self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
    }
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
    var `length`: Int {
        get { return self.count }
    }
 }
