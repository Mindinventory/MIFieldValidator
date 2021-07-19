//
//  BaseViewController.swift
//  ValidationsDemo
//
//  Created by mind-0023 on 19/07/21.
//  Copyright © 2021 Mac-0008. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var isHideNavigationBar : Bool = true {
        didSet{
            self.navigationController?.navigationBar.isHidden = isHideNavigationBar
        }
    }
    
    // MARK:- View LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        isHideNavigationBar = true
        configUI()
    }

    // MARK:- Push & Pop ViewController
    func push(To vc: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(vc, animated: animated)
    }

    func pop(_ animated: Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }
    
    func popToRoot(_ animated: Bool = true) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK:- General Methods -
    func configUI() { }
}
