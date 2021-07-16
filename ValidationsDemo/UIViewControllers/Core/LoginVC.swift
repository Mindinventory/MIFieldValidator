//
//  ViewController.swift
//  ValidationsDemo
//
//  Created by mac-0008 on 05/10/19.
//  Copyright © 2019 Mac-0008. All rights reserved.
//

import UIKit

final class LoginVC: UIViewController {

    // MARK:- IBOutlets -
    @IBOutlet weak var viewFUserImage: UIView!{
        didSet{
            viewFUserImage.configShadowAndBorder()
        }
    }
    @IBOutlet weak var viewFpasswordImage: UIView!{
        didSet{
            viewFpasswordImage.configShadowAndBorder()
        }
    }
    @IBOutlet weak var btnLogin: UIButton!{
        didSet{
            btnLogin.applyCircle()
        }
    }
    @IBOutlet weak private var txtFEmail: UITextField!
    @IBOutlet weak private var txtFPassword: UITextField!
    @IBOutlet weak var imageVpassworkKey: UIImageView!
    @IBOutlet weak var imageVuser: UIImageView!

    // MARK:- View LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
}

//MARK:- Action methods -
extension LoginVC {
    @IBAction func onLoginClicked(_ sender: UIButton) {
        // Check Validation For Login Screen
        if MIValidation.isUserCanAbleToLogin(txtFEmail.text ?? "",txtFPassword.text ?? "") {
            self.txtFEmail.text = ""
            self.txtFPassword.text = ""
            if let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC {
                self.navigationController?.pushViewController(homeVc, animated: true)
            }
        }
    }

    @IBAction func onForgotPassClicked(_ sender: UIButton) {
        // Navigate to Forgot Password Screen
        if let forgotPasswordVc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") {
            self.navigationController?.pushViewController(forgotPasswordVc, animated: true)
        }
    }

    @IBAction func onSignUpClicked(_ sender: UIButton) {
        // Navigate to Sign Up Screen
        if let signUpVc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") {
            self.navigationController?.pushViewController(signUpVc, animated: true)
        }
    }
}

//MARK: - TextField Delegate -
extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtFPassword.resignFirstResponder()
        txtFEmail.resignFirstResponder()
        return true
    }
}
