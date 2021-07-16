# MIFieldValidator
Field Validator is the simplest way to use custom field validator.This is one of the smart class for validating fields in a single line of code.  It's a very smart code saver class to validate name, password, DOB, Change password, email, phone number and many more.....
 
### MIFieldValidator
<img src = "https://user-images.githubusercontent.com/87411101/125917356-32c95bce-6798-4a79-8ba0-42d037b4028f.gif" width="200" height="400"> <img src = "https://user-images.githubusercontent.com/87411101/125918400-1bde0d2a-ff2d-4f28-a250-d8117b7f7e50.gif" width="200" height="400"> <img src = "https://user-images.githubusercontent.com/87411101/125918855-51d1ffd7-015f-4de2-be4e-60f8b43cc390.gif" width="200" height="400"> <img src = "https://user-images.githubusercontent.com/87411101/125918877-4249c344-4ac4-4b85-b843-50fc6c57fcbc.gif" width="200" height="400">





### Methods : 11

1) static func isUserCanAbleToLogin(_ userName: String, _ password: String, _ isEmailLogin: Bool = true) -> Bool
2) static func isValidData(_ validationModel: [ValidationModel]) -> Bool
3) static func isMessageInRange(_ text: String?, _ charMaxLimit: Int, _ message: String) -> Bool
4) static func changePassword(currentPassword: String, _ oldPassword: String, _ newPassword: String, _ confirmPassword: String) -> Bool
5) static func checkPasswordsSame(_ password1: String, _ password2: String, _ isOldAndCurrent: Bool) -> Bool
6) static func isMatchedPasswords(_ password: String?, _ cPassword: String?) -> Bool
7) static func isValidPassword(_ text: String?, _ message: String?) -> Bool
8) static func isValidMobileNumber(_ text: String?) -> Bool
9) static func isValidEmail(_ text: String?) -> Bool
10) static func isNotBlank(_ text: String?, _ message: String) -> Bool
11) static func isDOB(_ minimumAge: Int = minAge, text: String?, date: Date?) -> Bool

### Key features & Use

- - - > Check Required Field(Not Empty) (Like FirstName, LastName, UserName etc…)

EX:- Full Name Textfield -> txtFName: 

		MIValidation.isValidData([ValidationModel(validation: .notEmpty, value: txtFName.text, message: “Blank Full Name”)])

- - - > Validate Message Maximum Character Range

EX:- Full Name Textfield -> txtFName: 

		MIValidation.isValidData([ValidationModel(validation: .msgRange, value: txtFName.text, message: “Blank Full Name”)])

- - - > Valid Email Address

EX:- Email Textfield -> txtFEmail: 

	  MIValidation.isValidEmail(txtFEmail.text) — Return True or False

- - - > Valid Phone Number
		
EX:- PhoneNumber Textfield -> txtFPhoneNumber: 

	  MIValidation.isValidMobileNumber(txtFPhoneNumber.text) — Return True or False

- - - > Validate Date of Birth (Minimum Age Validation)

EX:- DOB Textfield -> txtFDOB: 

		MIValidation.isValidData([ValidationModel(validation: .dateOfBirth, value: txtFDOB.text, message: “Blank Date Of Birth”)])

- - - > Validate Password

EX:- Password Textfield -> txtFPassword: 

		MIValidation.isValidData([ValidationModel(validation: .password, value: txtFDOB.text, message: “Blank Password”)])

- - - > Check Equality and Comparison

EX:- New Password Textfield -> txtFNewPass and Confirm Password -> txtFCPass : 

		MIValidation.checkPasswordsSame(txtFNewPass.text,  txtFCPass.text) — Return True Or False 

- - - > Validate Credential  of Login Screen 

EX:- Email Textfield  -> txtFEmail and Password Textfield -> txtFPassword : 

		— For Login Validation Only Call This

	  MIValidation.isUserCanAbleToLogin(txtFEmail.text, txtFPassword.text) — Return True or False

- - - > Validate Change Password

EX:-  TextField Value
		- CurrentPassword = mind@123
		- OldPassword = txtFOldPass
		- NewPassword = txtFNewPass
		- ConfirmPassword = txtFConfirmPassword
	
	  — For Change Password Validation Only Call This

	  MIValidation.changePassword(currentPassword: “mind@123”, txtFOldPass.text, txtFNewPass.text, txtFConfirmPass.text)  		
	  — Return True or False

- - - > Validate SignUp with Normal Fields

EX:-  validation Array Look 

		arrValidationModel = [ValidationModel(validation: .msgRange, value: txtFName.text, message: “Blank Full Name”),
 						ValidationModel(validation: .email, value: txtFEmailAddress.text, message: “Blank Email Address”),
 						ValidationModel(validation: .mobileNumber, value: txtFMobileNumber.text, message: “Blank Phone Number”), 
 						ValidationModel(validation: .dateOfBirth, value: txtFDOB.text, message: “Blank Date Of Birth”, 
						ValidationModel(validation: .password, value: txtFPassword.text, message: “Blank Password”)]

		— For Sign Up Validation Call Only This

		MIValidation.isValidData(arrValidationModel) — Return True or false

# Usage

### Implementation

* Step 1. Add the MIValidations.swift in your project
 
* Step 2. Start using with your parameter

### Requirements
 
* Xcode 10.2 or later
 
# LICENSE!

MIFieldValidator is [MIT-licensed](/LICENSE).

# Let us know!
We’d be really happy if you send us links to your projects where you use our component. Just send an email to sales@mindinventory.com And do let us know if you have any questions or suggestion regarding our work.
