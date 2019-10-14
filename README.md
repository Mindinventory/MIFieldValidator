# MIFieldValidator
Field Validator is the simplest way to use custom field validator.This is one of the smart class for validating fields in a single line of code.  It's a very smart code saver class to validate name, password, DOB, Change password, email, phone number and many more.....
 
### MIFieldValidator
![image](/Media/MIFieldValidator.gif)

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
		- CurrentPassword = abc@1234
		- OldPassword = txtFOldPass
		- NewPassword = txtFNewPass
		- ConfirmPassword = txtFConfirmPassword
	
	  — For Change Password Validation Only Call This

	  MIValidation.changePassword(currentPassword: “abc@1234”, txtFOldPass.text, txtFNewPass.text, txtFConfirmPass.text)  		
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
