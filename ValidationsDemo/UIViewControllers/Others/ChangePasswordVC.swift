//
//  ChangePasswordVC.swift
//  ValidationsDemo
//
//  Created by mac-00011 on 09/10/19.
//  Copyright © 2019 Mac-0008. All rights reserved.
//

import UIKit

final class ChangePasswordVC: BaseViewController {

    // MARK:- IBOutlets -
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet private weak var confirmPasswordFieldView: InputBaseView!
    @IBOutlet private weak var newPasswordFieldView: InputBaseView!
    @IBOutlet private weak var oldPasswordFieldView: InputBaseView!
    @IBOutlet private weak var updateButton: UIButton!

    // MARK:- View LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isHideNavigationBar = true
    }

    // MARK:- General Methods -
    private func removeInputValues() {
        self.oldPasswordFieldView.textField.text = ""
        self.newPasswordFieldView.textField.text = ""
        self.confirmPasswordFieldView.textField.text = ""
    }

    override func configUI() {
        
        oldPasswordFieldView.textField.isSecureTextEntry = true
        newPasswordFieldView.textField.isSecureTextEntry = true
        confirmPasswordFieldView.textField.isSecureTextEntry = true

        
        updateButton.applyCircle()
        containerView.makeRoundedCorner(cornderRadious: 20, isTopLeftCorner: true, isTopRightCorner: true, isBottomLeftCorner: false, isBottomRightCorner: false)
    }
    
    
    @IBAction func onBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK:- Action Events -
extension ChangePasswordVC {
    @IBAction func onUpdateClicked(_ sender: UIButton) {
        // Check Validation For Change Password
        let currentPassword = CCurrentPassword // For Testing Set Current Password mind@123
        if MIValidation.changePassword(
            currentPassword: currentPassword,
            oldPasswordFieldView.textField.text?.trim ?? "",
            newPasswordFieldView.textField.text?.trim ?? "",
            confirmPasswordFieldView.textField.text?.trim ?? ""
        ) {
            self.view.endEditing(true)
            CTopMostViewController.presentAlertViewWithOneButtonMIV(
                alertTitle: nil,
                alertMessage: CPasswordChangeAlert ,
                btnOneTitle: COk) { (onOkClicked) in
                self.removeInputValues()
                self.pop()
            }
        }
    }
}

