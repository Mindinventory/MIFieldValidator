//
//  SignUpVC.swift
//  ValidationsDemo
//
//  Created by mac-00011 on 09/10/19.
//  Copyright © 2019 Mac-0008. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    // MARK:- UI Outlets
    // MARK:-
    
    @IBOutlet weak var viewFPasswordImage: UIView!{
        didSet{
            viewFPasswordImage.addConfig()
        }
    }
    @IBOutlet weak var viewFDOBImage: UIView!{
        didSet{
            viewFDOBImage.addConfig()
        }
    }
    @IBOutlet weak var viewFGenderImage: UIView!{
        didSet{
            viewFGenderImage.addConfig()
        }
    }
    @IBOutlet weak var viewFMobileNumberImage: UIView!{
        didSet{
            viewFMobileNumberImage.addConfig()
        }
    }
    @IBOutlet weak var viewFEmailAddressImage: UIView!{
        didSet{
            viewFEmailAddressImage.addConfig()
        }
    }
    @IBOutlet weak var viewFNameImage: UIView!{
        didSet{
            viewFNameImage.addConfig()
        }
    }
    @IBOutlet weak var txtFName: UITextField!{
        didSet{
            txtFName.addConfig()
        }
    }
    @IBOutlet weak var txtFEmailAddress: UITextField!{
        didSet{
            txtFEmailAddress.addConfig()
        }
    }
    @IBOutlet weak var txtFMobileNumber: UITextField!{
        didSet{
            txtFMobileNumber.addConfig()
        }
    }
    @IBOutlet weak var txtFGender: UITextField!{
        didSet{
            txtFGender.addConfig()
        }
    }
    @IBOutlet weak var txtFDOB: UITextField!{
        didSet{
            txtFDOB.addConfig()
        }
    }
    @IBOutlet weak var txtFPassword: UITextField!{
        didSet{
            txtFPassword.addConfig()
        }
    }
    @IBOutlet weak var btnFSignUp: UIButton!{
        didSet{
            btnFSignUp.applyCircle()
        }
    }
    
    // MARK:- View LifeCycle
    // MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
        
        //Set Padding in Text
        self.txtFName.setEmptyLeftView(WithPadding: 40)
        self.txtFPassword.setEmptyLeftView(WithPadding: 40)
        self.txtFMobileNumber.setEmptyLeftView(WithPadding: 40)
        self.txtFGender.setEmptyLeftView(WithPadding: 40)
        self.txtFDOB.setEmptyLeftView(WithPadding: 40)
        self.txtFPassword.setEmptyLeftView(WithPadding: 40)
        self.txtFEmailAddress.setEmptyLeftView(WithPadding: 40)        
    }
}

// MARK:- General Methods
// MARK:-

extension SignUpVC {
    
    func initialize() {
        
        // Hide Back Button
        self.navigationItem.hidesBackButton = true
        
        // Set Date Picker on TxtFDOB
        txtFDOB.setDatePickerMode(mode: .date)
        txtFDOB.setDatePickerWithDateFormate(dateFormate: "dd MMM yyyy", defaultDate: Date(), isPrefilledDate: false) { (date) in
            self.txtFDOB.text = "\(DateFormatter.sharedMIV().stringMIV(fromDate: date, dateFormat: "dd MMM yyyy"))"
        }
        
        // Set Picker on TxtFGender
        self.txtFGender.setPickerData(arrPickerData: [CMale, CFemale, COther], selectedPickerDataHandler: { (text, row, component) in
            self.txtFGender.text = text
        }, defaultPlaceholder: nil)
    }
}

// MARK:- Action Events
// MARK:-

extension SignUpVC {
    
    @IBAction func onLoginClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onSignUpClicked(_ sender: UIButton) {
          
        let arrValidationModel: [ValidationModel] = [ValidationModel(validation: .msgRange, value:                                         txtFName?.text?.trim, message: CBlankFullName),
                                                     ValidationModel(validation: .email, value: txtFEmailAddress?.text?.trim, message: CBlankEmail),
                                                     ValidationModel(validation: .mobileNumber, value: txtFMobileNumber?.text?.trim, message: CBlankPhoneNumber),
                                                     ValidationModel(validation: .notEmpty, value: txtFGender?.text?.trim, message: CBlankGender),
                                                     ValidationModel(validation: .dateOfBirth, value: self.txtFDOB?.text, message: CBlankDateOfBirth),
                                                     ValidationModel(validation: .password, value: txtFPassword?.text?.trim, message: CBlankPswd)]
        
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

