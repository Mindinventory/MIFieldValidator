//
//  ChangePasswordVC.swift
//  ValidationsDemo
//
//  Created by mac-00011 on 09/10/19.
//  Copyright © 2019 Mac-0008. All rights reserved.
//

import UIKit

class ChangePasswordVC: UIViewController {

    // MARK:- UI Outlets
    // MARK:-
    
    @IBOutlet weak var txtFOldPass: UITextField!
    @IBOutlet weak var txtFNewPass: UITextField!
    @IBOutlet weak var txtFConfirmPass: UITextField!
    
    // MARK:- View LifeCycle
    // MARK:-
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK:- Action Events
// MARK:-

extension ChangePasswordVC {
    
    @IBAction func onUpdateClicked(_ sender: UIButton) {
        
        // Check Validation For Change Password
        
        let currentPassword = "mind@123" // For Testing Set Current Password mind@123
        
        if MIValidation.changePassword(currentPassword: currentPassword, txtFOldPass.text?.trim ?? "", txtFNewPass.text?.trim ?? "", txtFConfirmPass.text?.trim ?? "") {
            
            self.view.endEditing(true)
            CTopMostViewController.presentAlertViewWithOneButtonMIV(alertTitle: nil, alertMessage: "Change Password Successfully", btnOneTitle: COk) { (onOkClicked) in
                self.txtFOldPass.text = ""
                self.txtFNewPass.text = ""
                self.txtFConfirmPass.text = ""
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
