//
//  ExtensionUIView.swift
//  ValidationsDemo
//
//  Created by Mind on 14/07/21.
//  Copyright © 2021 Mac-0008. All rights reserved.
//

import UIKit

//MARK: - Configurations for UIView -
extension UIView {
    func configShadowAndBorder() {
        self.applyCircle()
        self.dropShadow(shadowRadius: 7)
        self.addBorder(width: 0.25)
        self.backgroundColor = .white
    }

    ////Method for drop shadow
    func dropShadow(shadowRadius: CGFloat = 0.0) {
        layer.shadowColor = UIColor(named: CshadowColor)!.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0.3
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }

    ////Method to add border
    func addBorder(width: CGFloat) {
        self.layer.borderColor = UIColor(named: CshadowColor)!.withAlphaComponent(0.25).cgColor
        self.layer.borderWidth = width
    }

    ////Method to add round corners
    func applyCircle() {
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width)*0.5
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
}
