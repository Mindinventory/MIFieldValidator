//
//  ViewController.swift
//  ValidationsDemo
//
//  Created by mac-0008 on 05/10/19.
//  Copyright © 2019 Mac-0008. All rights reserved.
//

import UIKit

final class LoginVC: BaseViewController {

    // MARK:- IBOutlets -
    @IBOutlet private weak var eMailFieldView: InputBaseView!
    @IBOutlet private weak var passwordFieldView: InputBaseView!    
    @IBOutlet private weak var loginButton: UIButton!

    // MARK:- View LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:- General Methods -
    private func removeInputValues() {
        self.eMailFieldView.textField.text = ""
        self.passwordFieldView.textField.text = ""
    }

    override func configUI() {
        loginButton.applyCircle()
        eMailFieldView.textField.keyboardType = .emailAddress
        passwordFieldView.textField.isSecureTextEntry = true
    }
}

//MARK:- Action methods -
extension LoginVC {
    @IBAction func onLoginClicked(_ sender: UIButton) {
        // Check Validation For Login Screen
        if MIValidation.isUserCanAbleToLogin(
            eMailFieldView.textField.text ?? "",
            passwordFieldView.textField.text ?? ""
        ) {
            removeInputValues()
            if let homeVc = UIStoryboard.main.get(controller: HomeVC.self) {
                self.push(To: homeVc)
            }
        }
    }

    @IBAction func onForgotPassClicked(_ sender: UIButton) {
        // Navigate to Forgot Password Screen
        if let forgotPasswordVc = UIStoryboard.main.get(controller: ForgotPasswordVC.self) {
            self.push(To: forgotPasswordVc)
        }
    }

    @IBAction func onSignUpClicked(_ sender: UIButton) {
        // Navigate to Sign Up Screen
        if let signUpVc = UIStoryboard.main.get(controller: SignUpVC.self) {
            self.push(To: signUpVc)
        }
    }
}
