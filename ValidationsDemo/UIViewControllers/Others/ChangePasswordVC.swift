//
//  ChangePasswordVC.swift
//  ValidationsDemo
//
//  Created by mac-00011 on 09/10/19.
//  Copyright © 2019 Mac-0008. All rights reserved.
//

import UIKit

final class ChangePasswordVC: UIViewController {

    // MARK:- IBOutlets -
    @IBOutlet weak var viewFConfirmPasswordImage: UIView!{
        didSet{
            viewFConfirmPasswordImage.configShadowAndBorder()
        }
    }
    @IBOutlet weak var viewFNewPasswordImage: UIView!{
        didSet{
            viewFNewPasswordImage.configShadowAndBorder()
        }
    }
    @IBOutlet weak var viewFOldPasswordImage: UIView!{
        didSet{
            viewFOldPasswordImage.configShadowAndBorder()
        }
    }
    @IBOutlet weak var btnFUpdate: UIButton!{
        didSet{
            btnFUpdate.applyCircle()
        }
    }
    @IBOutlet weak var txtFOldPass: UITextField!{
        didSet{
            txtFOldPass.delegate = self
        }
    }
    @IBOutlet weak var txtFNewPass: UITextField!{
        didSet{
            txtFNewPass.delegate = self
        }
    }
    @IBOutlet weak var txtFConfirmPass: UITextField!{
        didSet{
            txtFConfirmPass.delegate = self
        }
    }

    // MARK:- View LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK:- Action Events -
extension ChangePasswordVC {
    @IBAction func onUpdateClicked(_ sender: UIButton) {
        // Check Validation For Change Password
        let currentPassword = "mind@123" // For Testing Set Current Password mind@123
        if MIValidation.changePassword(currentPassword: currentPassword, txtFOldPass.text?.trim ?? "", txtFNewPass.text?.trim ?? "", txtFConfirmPass.text?.trim ?? "") {
            
            self.view.endEditing(true)
            CTopMostViewController.presentAlertViewWithOneButtonMIV(
                alertTitle: nil,
                alertMessage: "Password Changed Succesfully",
                btnOneTitle: COk) { (onOkClicked) in
                self.txtFOldPass.text = ""
                self.txtFNewPass.text = ""
                self.txtFConfirmPass.text = ""
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}

extension ChangePasswordVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
