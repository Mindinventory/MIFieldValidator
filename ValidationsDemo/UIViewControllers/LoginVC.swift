//
//  ViewController.swift
//  ValidationsDemo
//
//  Created by mac-0008 on 05/10/19.
//  Copyright © 2019 Mac-0008. All rights reserved.
//

import UIKit

final class LoginVC: UIViewController {

    // MARK:- UI Outlets
    // MARK:-
    
    @IBOutlet weak private var txtFEmail: UITextField!
    @IBOutlet weak private var txtFPassword: UITextField!
    
    // MARK:- View LifeCycle
    // MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
}

// MARK:- General Methods
// MARK:-

extension LoginVC {
    
    func initialize() {
        
        // Set Navigation Bar Transperent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        // Set Right Image in TextField
        self.txtFEmail.addRightImageAsRightView(strImgName: "ic_user", rightPadding: 10)
        self.txtFPassword.addRightImageAsRightView(strImgName: "ic_key", rightPadding: 10)
    }
}

//MARK:- Action methods
//MARK:-

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
