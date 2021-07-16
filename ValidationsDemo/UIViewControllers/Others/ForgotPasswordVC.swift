//
//  ForgotPasswordVC.swift
//  ValidationsDemo
//
//  Created by mac-00011 on 14/10/19.
//  Copyright © 2019 Mac-0008. All rights reserved.
//

import UIKit

final class ForgotPasswordVC: UIViewController {

    // MARK:- IBOutlets -
    @IBOutlet weak var viewFEmailImage: UIView!{
        didSet{
            viewFEmailImage.configShadowAndBorder()
        }
    }
    @IBOutlet weak var btnFsendLink: UIButton!{
        didSet{
            btnFsendLink.applyCircle()
        }
    }
    @IBOutlet weak var txtFEmail: UITextField!{
        didSet{
            txtFEmail.delegate = self
        }
    }

    // MARK:- View LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}

// MARK:- Action Events -
extension ForgotPasswordVC {
    @IBAction func onSendLinkClicked(_ sender: UIButton) {
        // Check Forgot Password Validation
        if MIValidation.isValidEmail(self.txtFEmail.text) {
            self.view.endEditing(true)
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension ForgotPasswordVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

