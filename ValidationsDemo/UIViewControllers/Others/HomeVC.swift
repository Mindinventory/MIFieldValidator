//
//  HomeVC.swift
//  ValidationsDemo
//
//  Created by mac-00011 on 14/10/19.
//  Copyright © 2019 Mac-0008. All rights reserved.
//

import UIKit

final class HomeVC: BaseViewController {

   // MARK:- View LifeCycle -
   override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    
    self.isHideNavigationBar = true
    }
    
    @IBAction func onBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK:- General Methods -
extension HomeVC {
    fileprivate func initialize() {
        self.isHideNavigationBar = false
        // Set Left Bar Button in Navigation Bar
        let logOutButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icLogOut"), style: .plain, target: self, action: #selector(onBack))
        self.navigationItem.leftBarButtonItem = logOutButton
        self.title = logOutTitle
    }
}

// MARK:- Action Events -
extension HomeVC {
    @IBAction func onChangePasswordClicked(_ sender: UIButton) {
        if let changePasswordVc = UIStoryboard.main.get(controller: ChangePasswordVC.self) {
            self.push(To: changePasswordVc)
        }
    }

    @objc func onBack() {
        self.isHideNavigationBar = true
        self.popToRoot()
    }
}
