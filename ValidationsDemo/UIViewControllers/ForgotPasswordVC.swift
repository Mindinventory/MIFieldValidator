//
//  ForgotPasswordVC.swift
//  ValidationsDemo
//
//  Created by mac-00011 on 14/10/19.
//  Copyright © 2019 Mac-0008. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    // MARK:- UI Outlets
    // MARK:-
    
    @IBOutlet weak var txtFEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK:- Action Events
// MARK:-

extension ForgotPasswordVC {
    
    @IBAction func onSendLinkClicked(_ sender: UIButton) {
        
        // Check Forgot Password Validation
        if MIValidation.isValidEmail(self.txtFEmail.text) {
            self.view.endEditing(true)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
