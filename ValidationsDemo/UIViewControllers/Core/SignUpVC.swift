//
//  SignUpVC.swift
//  ValidationsDemo
//
//  Created by mac-00011 on 09/10/19.
//  Copyright © 2019 Mac-0008. All rights reserved.
//

import UIKit

final class SignUpVC: UIViewController {

    // MARK:- IBOutlets -
    @IBOutlet weak var viewFPasswordImage: UIView!{
        didSet{
            viewFPasswordImage.configShadowAndBorder()
        }
    }
    @IBOutlet weak var viewFDOBImage: UIView!{
        didSet{
            viewFDOBImage.configShadowAndBorder()
        }
    }
    @IBOutlet weak var viewFGenderImage: UIView!{
        didSet{
            viewFGenderImage.configShadowAndBorder()
        }
    }
    @IBOutlet weak var viewFMobileNumberImage: UIView!{
        didSet{
            viewFMobileNumberImage.configShadowAndBorder()
        }
    }
    @IBOutlet weak var viewFEmailAddressImage: UIView!{
        didSet{
            viewFEmailAddressImage.configShadowAndBorder()
        }
    }
    @IBOutlet weak var viewFNameImage: UIView!{
        didSet{
            viewFNameImage.configShadowAndBorder()
        }
    }
    @IBOutlet weak var btnFSignUp: UIButton!{
        didSet{
            btnFSignUp.applyCircle()
        }
    }
    @IBOutlet weak var txtFName: UITextField!{
        didSet{
            txtFName.delegate = self
        }
    }
    @IBOutlet weak var txtFEmailAddress: UITextField!{
        didSet{
            txtFEmailAddress.delegate = self
        }
    }
    @IBOutlet weak var txtFMobileNumber: UITextField!{
        didSet{
            txtFMobileNumber.delegate = self
        }
    }
    @IBOutlet weak var txtFGender: UITextField!{
        didSet{
            txtFGender.delegate = self
        }
    }
    @IBOutlet weak var txtFDOB: UITextField!{
        didSet{
            txtFDOB.delegate = self
        }
    }
    @IBOutlet weak var txtFPassword: UITextField!{
        didSet{
            txtFPassword.delegate = self
        }
    }

    // MARK:- View LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
}

// MARK:- General Methods -
extension SignUpVC {
    fileprivate func initialize() {
        // Set Date Picker on TxtFDOB
        txtFDOB.setDatePickerMode(mode: .date)
        txtFDOB.setDatePickerWithDateFormate(
            dateFormate: "dd MMM yyyy",
            defaultDate: Date(),
            isPrefilledDate: false) { (date) in
            self.txtFDOB.text = "\(DateFormatter.sharedMIV().stringMIV(fromDate: date, dateFormat: "dd MMM yyyy"))"
        }
        
        // Set Picker on TxtFGender
        self.txtFGender.setPickerData(
            arrPickerData: [CMale, CFemale, COther],
            selectedPickerDataHandler: { (text, row, component) in
                self.txtFGender.text = text
            }, defaultPlaceholder: nil)
    }
}

// MARK:- Action Events -
extension SignUpVC {

    @IBAction func onLoginClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func onSignUpClicked(_ sender: UIButton) {

        let arrValidationModel = [
            ValidationModel(validation: .msgRange, value: txtFName?.text?.trim, message: CBlankFullName),
            ValidationModel(validation: .email, value: txtFEmailAddress?.text?.trim, message: CBlankEmail),
            ValidationModel(validation: .mobileNumber, value: txtFMobileNumber?.text?.trim, message: CBlankPhoneNumber),
            ValidationModel(validation: .notEmpty, value: txtFGender?.text?.trim, message: CBlankGender),
            ValidationModel(validation: .dateOfBirth, value: self.txtFDOB?.text, message: CBlankDateOfBirth),
            ValidationModel(validation: .password, value: txtFPassword?.text?.trim, message: CBlankPswd)
        ]
        
        // Check Validation Of SignUp
        if MIValidation.isValidData(arrValidationModel) {
            self.view.endEditing(true)
            self.txtFName.text = ""
            self.txtFDOB.text = ""
            self.txtFGender.text = ""
            self.txtFEmailAddress.text = ""
            self.txtFGender.text = ""
            self.txtFMobileNumber.text = ""
            // Navigate Home Screen
            if let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC {
                self.navigationController?.pushViewController(homeVc, animated: true)
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

