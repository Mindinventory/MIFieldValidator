//
//  SignUpVC.swift
//  ValidationsDemo
//
//  Created by mac-00011 on 09/10/19.
//  Copyright © 2019 Mac-0008. All rights reserved.
//

import UIKit

final class SignUpVC: BaseViewController {
    
    // MARK:- IBOutlets -
    @IBOutlet private weak var nameFieldView: InputBaseView!
    @IBOutlet private weak var eMailFieldView: InputBaseView!
    @IBOutlet private weak var numberFieldView: InputBaseView!
    @IBOutlet private weak var genderFieldView: InputBaseView!
    @IBOutlet private weak var dobFieldView: InputBaseView!
    @IBOutlet private weak var passwordFieldView: InputBaseView!
    @IBOutlet private weak var signUpButton: UIButton!

    // MARK:- View LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }

    //MARK: - ConfigUI -
    override func configUI() {
        signUpButton.applyCircle()
        eMailFieldView.textField.keyboardType = .emailAddress
        numberFieldView.textField.keyboardType = .numberPad
    }
}

// MARK:- General Methods -
extension SignUpVC {

    fileprivate func initialize() {
        // Set Date Picker on TxtFDOB
        dobFieldView.textField.setDatePickerMode(mode: .date)
        dobFieldView.textField.setDatePickerWithDateFormate(
            dateFormate: dateFormat,
            defaultDate: Date(),
            isPrefilledDate: false) { (date) in
            self.dobFieldView.textField.text = "\(DateFormatter.sharedMIV().stringMIV(fromDate: date, dateFormat: dateFormat))"
        }

        // Set Picker on TxtFGender
        self.genderFieldView.textField.setPickerData(
            arrPickerData: [CMale, CFemale, COther],
            selectedPickerDataHandler: { (text, row, component) in
                self.genderFieldView.textField.text = text
            }, defaultPlaceholder: nil)
    }

    private func removeInputValues() {
        nameFieldView.textField.text = ""
        dobFieldView.textField.text = ""
        genderFieldView.textField.text = ""
        eMailFieldView.textField.text = ""
        numberFieldView.textField.text = ""
    }
}

// MARK:- Action Events -
extension SignUpVC {
    @IBAction func onLoginClicked(_ sender: UIButton) {
        self.pop()
    }
    
    @IBAction func onSignUpClicked(_ sender: UIButton) {
        let arrValidationModel = [
            ValidationModel(validation: .msgRange, value: nameFieldView.textField.text?.trim, message: CBlankFullName),
            ValidationModel(validation: .email, value: eMailFieldView.textField.text?.trim, message: CBlankEmail),
            ValidationModel(validation: .mobileNumber, value: numberFieldView.textField.text?.trim, message: CBlankPhoneNumber),
            ValidationModel(validation: .notEmpty, value:genderFieldView.textField.text?.trim, message: CBlankGender),
            ValidationModel(validation: .dateOfBirth, value: dobFieldView.textField.text?.trim, message: CBlankDateOfBirth),
            ValidationModel(validation: .password, value: passwordFieldView.textField.text?.trim, message: CBlankPswd)
        ]
        
        // Check Validation Of SignUp
        if MIValidation.isValidData(arrValidationModel) {
            self.view.endEditing(true)
            removeInputValues()
            // Navigate Home Screen
            if let homeVc = UIStoryboard.main.get(controller: HomeVC.self) {
                self.push(To: homeVc)
            }
        }
    }
}

//MARK: - Textfield Delegate -
extension SignUpVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

