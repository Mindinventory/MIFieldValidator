//
//  ForgotPasswordVC.swift
//  ValidationsDemo
//
//  Created by mac-00011 on 14/10/19.
//  Copyright © 2019 Mac-0008. All rights reserved.
//

import UIKit

final class ForgotPasswordVC: BaseViewController {

    // MARK:- IBOutlets -
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet private weak var emailFieldView: InputBaseView!
    @IBOutlet private weak var sendLinkButton: UIButton!
    

    // MARK:- View LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isHideNavigationBar = true
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.isHideNavigationBar = true
    }

    // MARK:- General Methods -
    override func configUI() {
        sendLinkButton.applyCircle()
        containerView.makeRoundedCorner(cornderRadious: 20, isTopLeftCorner: true, isTopRightCorner: true, isBottomLeftCorner: false, isBottomRightCorner: false)
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

// MARK:- Action Events -
extension ForgotPasswordVC {
    @IBAction func onSendLinkClicked(_ sender: UIButton) {
        // Check Forgot Password Validation
        if MIValidation.isValidEmail(self.emailFieldView.textField.text) {
            self.view.endEditing(true)
            self.pop()
        }
    }
}

