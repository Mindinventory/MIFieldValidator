//
//  HomeVC.swift
//  ValidationsDemo
//
//  Created by mac-00011 on 14/10/19.
//  Copyright © 2019 Mac-0008. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
}

// MARK:- General Methods
// MARK:-

extension HomeVC {
    
    func initialize() {
        
        // Set Left Bar Button in Navigation Bar
        let btnLogout = UIBarButtonItem(image: UIImage(named: "icLogOut"), style: .plain, target: self, action: #selector(onBack))
        self.navigationItem.leftBarButtonItem = btnLogout
        self.title = "Settings"
    }
}

// MARK:- Action Events
// MARK:-

extension HomeVC {
    
    @IBAction func onChangePasswordClicked(_ sender: UIButton) {
        if let changePasswordVc = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordVC") as? ChangePasswordVC {
            self.navigationController?.pushViewController(changePasswordVc, animated: true)
        }
    }
    
    @objc func onBack() {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
}
