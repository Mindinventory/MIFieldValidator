//
//  ExtensionUIStoryBoard.swift
//  ValidationsDemo
//
//  Created by Mind on 19/07/21.
//  Copyright © 2021 Mac-0008. All rights reserved.
//

import UIKit

enum StoryboardName: String{
    case main = "Main"
}

extension UIStoryboard {
    static var main: UIStoryboard {
        return UIStoryboard(name: StoryboardName.main.rawValue, bundle: nil)
    }

    func get<T: UIViewController>(controller: T.Type) -> T?{
        return self.instantiateViewController(withIdentifier: String(describing: controller)) as? T
    }
}
