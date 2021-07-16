//
//  HomeVC.swift
//  ValidationsDemo
//
//  Created by mac-00011 on 14/10/19.
//  Copyright © 2019 Mac-0008. All rights reserved.
//

import UIKit

final class HomeVC: UIViewController {
    // MARK:- View LifeCycle -
   override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
}

// MARK:- General Methods -
extension HomeVC {
    fileprivate func initialize() {
        self.navigationController?.navigationBar.isHidden = false
        // Set Left Bar Button in Navigation Bar
        let btnLogout = UIBarButtonItem(image: UIImage(named: "icLogOut"), style: .plain, target: self, action: #selector(onBack))
        self.navigationItem.leftBarButtonItem = btnLogout
        self.title = "Settings"
    }
}

// MARK:- Action Events -
extension HomeVC {
    @IBAction func onChangePasswordClicked(_ sender: UIButton) {
        if let changePasswordVc = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordVC") as? ChangePasswordVC {
            self.navigationController?.pushViewController(changePasswordVc, animated: true)
        }
    }

    @objc func onBack() {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.popToRootViewController(animated: true)
    }
}
