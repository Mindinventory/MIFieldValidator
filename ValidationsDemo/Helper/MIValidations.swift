//
//  MIValidations.swift
//  ValidationsDemo
//
//  Created by mac-0008 on 05/10/19.
//  Copyright © 2019 Mac-0008. All rights reserved.
//

import Foundation
import UIKit

//MARK:- Validation Enums -

enum ValidationOptions {
    case notEmpty, email, password, gender, dateOfBirth, mobileNumber, msgRange
}

//MARK:- Validation Messages -

private let charLimitForName = 15
private let minAge = 1

// Email
let CBlankEmail = "Please enter your email address."
let CBlankInvalidEmail = "Please enter a valid email address."

// MobileNumber
let CBlankPhoneNumber = "Please enter your phone number."
let CInvalidPhoneNumber = "Please enter a valid phone number."

// ChangePassword
private let CBlankOldPswd = "Please enter your old password."
let CBlankPswd = "Please enter your password."
private let CBlankNewPswd = "Please enter a new password."
private let CInvalidNewPswd = "Password must be a minimum of 8 characters alphanumeric and must contain at least one special character."
private let CMismatchNewConfirmPswd = "New password and confirm password doesn’t match."
private let CSameOldNewPswd = "New Password can not be same as Old password."
private let CSameCurrentOldPswd = "Old Password must be same as Current Password"

// Message or note
private let CBlankMessage = "Please enter a message"

// Sign up

let CBlankGender = "Please select gender"
let CBlankDateOfBirth = "Please select date of birth"
private let CMinAge = "Age should be greater than required"
let CBlankFullName = "Please enter your name"
private let CBlankConfirmPswd = "Please enter confirm password."
private let CExceedNameCharacterCount = "Name should not be more than 15 characters"
let CMale = "Male"
let CFemale = "Female"
let COther = "Other"

// Constants
let COk = "Ok"
let CshadowColor = "shadowColor"
let CCurrentPassword = "mind@123"
let CPasswordChangeAlert = "Password Changed Succesfully"
let logOutTitle = "Settings"
let dateFormat = "dd MMM yyyy"

let CSharedApplication = UIApplication.shared
let appDelegate = CSharedApplication.delegate as! AppDelegate

// Get Top Most View Controller
var CTopMostViewController: UIViewController {
    get { return CSharedApplication.topMostViewControllerMIV }
    set {}
}

let CMainScreen = UIScreen.main
let CBounds = CMainScreen.bounds
let CScreenSize = CBounds.size
let CScreenWidth = CScreenSize.width
 
//MARK:- Validation methods -
struct ValidationModel {
    let validation: ValidationOptions?
    let value: Any?
    let message: String?
}

class MIValidation {

    /// This Method Check to text is Blank or Not
    ///
    /// - Parameters:
    ///   - text: here we need to pass the text which you want to check for blank validatin
    ///   - message: here we need to pass message that you want to show in alert when that field is empty
    /// - Returns: check the validation successful
    
    private static func isNotBlank(_ text: String?, _ message: String) -> Bool {
        
        if let strText = text {
            if strText.isBlank {
                CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: message, btnOneTitle: COk, btnOneTapped: nil)
                return false
            }
            return true
        }
        
        CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: message, btnOneTitle: COk, btnOneTapped: nil)
        return false
    }
    
    
    /// This Method Check to Validation of Email(Blank and Valid)
    ///
    /// - Parameter text: here we need to pass the text which you want to check for email validatin
    /// - Returns: check the validation successful
    
    static func isValidEmail(_ text: String?) -> Bool {
        
        if let strEmail = text {
            
            if strEmail.isBlank {
                CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CBlankEmail, btnOneTitle: COk, btnOneTapped: nil)
                return false
            }
            
            if !strEmail.isValidEmail {
                CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CBlankInvalidEmail, btnOneTitle: COk, btnOneTapped: nil)
                return false
            }
            return true
        }
        
        CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CBlankEmail, btnOneTitle: COk, btnOneTapped: nil)
        return false
    }
    
    
    /// This Method Check to Validation of Mobile Number(Blank and Valid)
    ///
    /// - Parameter text: here we need to pass the text which you want to check for email validatin
    /// - Returns: check the validation successful
    
    private static func isValidMobileNumber(_ text: String?) -> Bool {
        
        if let strMobile = text {
            
            if strMobile.isBlank {
                CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CBlankPhoneNumber, btnOneTitle: COk, btnOneTapped: nil)
                return false
            }
            
            if !strMobile.isValidPhone {
                CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CInvalidPhoneNumber, btnOneTitle: COk, btnOneTapped: nil)
                return false
            }
            return true
        }
        
        CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CBlankPhoneNumber, btnOneTitle: COk, btnOneTapped: nil)
        return false
    }
    
    
    /// This Method Check to Validation of Password
    ///
    /// - Parameters:
    ///   - text: here we need to pass the text which you want to check for password validation
    ///   - message: This Message show on Alert
    /// - Returns: check the validation successful
    
    private static func isValidPassword(_ text: String?, _ message: String?) -> Bool {
        
        if let strPassword = text {
    
            if strPassword.isBlank {
                CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: message, btnOneTitle: COk, btnOneTapped: nil)
                return false
            }
            
            if !strPassword.isValidPassword {
                CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CInvalidNewPswd, btnOneTitle: COk, btnOneTapped: nil)
                return false
            }
            return true
        }
        
        CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: message, btnOneTitle: COk, btnOneTapped: nil)
        return false
    }
   
    
    /// This method is used to check the passwords matching and mismatching
    ///
    /// - Parameters:
    ///   - password: here we need to pass the text which you want to check for password validation
    ///   - cPassword: here we need to pass the text which you want to check for Confiorm password validation
    /// - Returns: check the validation successful
    
    private static func isMatchedPasswords(_ password: String?, _ cPassword: String?) -> Bool {
        
        if let strPassword = password {
            
            if strPassword.isBlank {
                CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CBlankPswd, btnOneTitle: COk, btnOneTapped: nil)
                return false
            }
        
            if !strPassword.isValidPassword {
                CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CInvalidNewPswd, btnOneTitle: COk, btnOneTapped: nil)
                return false
            }
        
            if strPassword != cPassword {
                CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CMismatchNewConfirmPswd, btnOneTitle: COk, btnOneTapped: nil)
                return false
            }
            return true
        }
        
        CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CBlankPswd, btnOneTitle: COk, btnOneTapped: nil)
        return false
    }
    
    /// This method is used to check the passwords matching and mismatching
    ///
    /// - Parameters:
    ///   - password1: here we need to pass the text which you want to check for password1
    ///   - password2: here we need to pass the text which you want to check for password2
    ///   - isOldAndCurrent: here we pass to boolean for which message show on Alert
    /// - Returns: check the validation successful
    
    private static func checkPasswordsSame(_ password1: String, _ password2: String, _ isOldAndCurrent: Bool) -> Bool {
        
        if password1 != password2 {
            CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: isOldAndCurrent ? CSameCurrentOldPswd : CMismatchNewConfirmPswd , btnOneTitle: COk, btnOneTapped: nil)
            return false
        }
        return true
    }
    
    
    /// This Function use For Change Password Validation
    ///
    /// - Parameters:
    ///   - currentPassword: here we need to pass the text which you want to check for current password validation
    ///   - oldPassword: here we need to pass the text which you want to check for old password validation
    ///   - newPassword: here we need to pass the text which you want to check for new password validation
    ///   - confirmPassword: here we need to pass the text which you want to check for confirm password validation
    /// - Returns: check the validation successful
    
    static func changePassword(currentPassword: String, _ oldPassword: String, _ newPassword: String, _ confirmPassword: String) -> Bool {
       
        if oldPassword.isBlank {
            CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CBlankOldPswd, btnOneTitle: COk, btnOneTapped: nil)
            return false
        }
        
        if !checkPasswordsSame(currentPassword, oldPassword, true) {
            return false
        }

        if !isValidPassword(newPassword, CBlankNewPswd) {
            return false
        }
        
        if oldPassword == newPassword {
            CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CSameOldNewPswd, btnOneTitle: COk, btnOneTapped: nil)
            return false
        }

        if confirmPassword.isBlank {
            CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CBlankConfirmPswd, btnOneTitle: COk, btnOneTapped: nil)
            return false
        }
        
        if !checkPasswordsSame(newPassword, confirmPassword, false) {
            return false
        }
        
        return true
    }
    
    /// This Method check to char limit of String
    ///
    /// - Parameters:
    ///   - text: here we need to pass the text which you want to check the limit of string
    ///   - charMaxLimit: here we need to pass the value if there is any min character count
    ///   - message: here we need to pass the message that you want to show in alert
    /// - Returns: check the validation successfull
    
    private static func isMessageInRange(_ text: String?, _ charMaxLimit: Int, _ message: String) -> Bool {
        
        if let strText = text {
           
            if strText.isBlank {
                CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: message, btnOneTitle: COk, btnOneTapped: nil)
                return false
            }
            
            if strText.count > charMaxLimit {
                CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CExceedNameCharacterCount, btnOneTitle: COk, btnOneTapped: nil)
                return false
            }
            return true
        }
        
        CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CBlankMessage, btnOneTitle: COk, btnOneTapped: nil)
        return false
    }
    
    
    /// This function get to age from birthDate
    ///
    /// - Parameter birthDate: here we need to pass the text which you want to check the date
    /// - Returns: check the validation successfull
    
    private static func age(birthDate: Date?) -> Int {
        
        let now = Date()
        if let birthday = birthDate {
            let calendar = Calendar.current
            let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
            let age = ageComponents.year!
            return age
        }
        return 0
    }
    
    /// This method check to validation For Login
    ///
    /// - Parameters:
    ///   - userName: here we need to pass username
    ///   - password: here we need to pass password
    ///   - isEmailLogin: if that is not any email login then we should pass false otherwise true
    /// - Returns: check the Login successfull
    
    static func isUserCanAbleToLogin(_ userName: String, _ password: String, _ isEmailLogin: Bool = true) -> Bool {
        
        if userName.isBlank {
            CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CBlankEmail, btnOneTitle: COk, btnOneTapped: nil)
            return false
        }
        
        if isEmailLogin {
            if !userName.isValidEmail {
                CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CBlankInvalidEmail, btnOneTitle: COk, btnOneTapped: nil)
                return false
            }
        }
        
        if password.isBlank || !password.isValidPassword{
            CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CBlankPswd, btnOneTitle: COk, btnOneTapped: nil)
            return false
        }
        return true
    }
    
    /// This Function check to minAge
    ///
    /// - Parameters:
    ///   - minAge: here we need to pass min age if there is any min age validation otherwise need pass 0
    ///   - text: here we need to pass dateOfbirth string value
    ///   - date: here we need to pass dateOfbirth date value
    /// - Returns: check the Login successfull
    
    private static func isDOB(_ minimumAge: Int = minAge, text: String?, date: Date?) -> Bool {
        
        if let strText = text {
            if strText.isBlank {
                CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CBlankDateOfBirth, btnOneTitle: COk, btnOneTapped: nil)
                return false
            }
            
            let age = MIValidation.age(birthDate: date)
            if age < minimumAge {
                CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CMinAge, btnOneTitle: COk, btnOneTapped: nil)
                return false
            }
            return true
        }
        
        CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: CBlankDateOfBirth, btnOneTitle: COk, btnOneTapped: nil)
        return false
       
    }
    
    /// This Method is use for Form Validation Like SignUp
    ///
    /// - Parameter validationModel: this parameter use for pass validation model like Message, Validation Option and Value
    /// - Returns: check the Validation successfull
    
    static func isValidData(_ validationModel: [ValidationModel]) -> Bool {
        
        for validateModel in validationModel {
            
            switch validateModel.validation {
                
            case .notEmpty?:
                if !isNotBlank(validateModel.value as? String, validateModel.message ?? "") {
                    return false
                }
                continue
                
            case .msgRange?:
                if !isMessageInRange(validateModel.value as? String, charLimitForName, validateModel.message ?? "") {
                    return false
                }
                continue
                
            case .mobileNumber?:
                
                if !isValidMobileNumber(validateModel.value as? String) {
                    return false
                }
                continue
                
            case .email?:
                
                if !isValidEmail(validateModel.value as? String) {
                    return false
                }
                continue
                
            case .dateOfBirth?:
                let date = DateFormatter.sharedMIV().dateMIV(fromString: validateModel.value as? String ?? "", dateFormat: "dd MM YYYY")
                
                if !isDOB(text: validateModel.value as? String, date: date) {
                    return false
                }
                continue
            case .password?:
                
                if !isValidPassword(validateModel.value as? String, validateModel.message) {
                    return false
                }
                continue
            default:
                continue
            }
        }
        return true
    }
    
}

//MARK:- Extension - DateFormatter Singleton -
extension DateFormatter {
    
    private static var sharedInstanceMIV: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.system
        return dateFormatter
    }()
    
    static func sharedMIV() -> DateFormatter {
        return sharedInstanceMIV
    }
    
    func stringMIV(fromDate: Date, dateFormat: String) -> String {
        self.dateFormat = dateFormat
        return self.string(from: fromDate)
    }
    
    func dateMIV(fromString: String, dateFormat: String) -> Date? {
        self.dateFormat = dateFormat
        return self.date(from: fromString)
    }
}

// MARK:- Extenstion UI ViewController -
extension UIViewController {
    
    typealias alertActionHandler = ((UIAlertAction) -> ())?
    
    /// This Method is used to show AlertView with one Button.
    ///
    /// - Parameters:
    ///   - alertTitle: A String value that indicates the title of AlertView , it is Optional so you can pass nil if you don't want Alert Title.
    ///   - alertMessage: A String value that indicates the title of AlertView , it is Optional so you can pass nil if you don't want alert message.
    ///   - btnOneTitle: A String value - Title of button.
    ///   - btnOneTapped: Button Tapped Handler (Optional - you can pass nil if you don't want any action).
    func presentAlertViewWithOneButtonMIV(alertTitle: String?, alertMessage: String?, btnOneTitle: String, btnOneTapped: alertActionHandler) {
        
        let alertController = UIAlertController(title: alertTitle ?? "", message: alertMessage ?? "", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: btnOneTitle, style: .default, handler: btnOneTapped))
        
        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK:- extension String -
extension String {
    
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isBlank: Bool {
        return self.trim.isEmpty
    }
    
    var isNotBlank: Bool {
        return !self.isBlank
    }
    
    var isValidEmail: Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with:self)
    }
    
    var isValidPhoneNo: Bool {
        
        let phoneCharacters = CharacterSet(charactersIn: "+0123456789").inverted
        let arrCharacters = self.components(separatedBy: phoneCharacters)
        return self == arrCharacters.joined(separator: "")
    }
    
    var isValidPassword: Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[@$!%*#?&])[0-9a-zA-Z@$!%*#?&]{8,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return predicate.evaluate(with:self)
    }
    
    var isValidPhone: Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{4,15}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
    
    var isValidURL: Bool {
        let urlRegEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        return NSPredicate(format: "SELF MATCHES %@", urlRegEx).evaluate(with: self)
    }
}

// MARK:- Extension UI Application -
extension UIApplication {
    
    var topMostViewControllerMIV: UIViewController {
        
        var topViewController = self.keyWindow?.rootViewController
        
        while topViewController?.presentedViewController != nil {
            topViewController = topViewController?.presentedViewController
        }
        
        return topViewController!
    }
}
