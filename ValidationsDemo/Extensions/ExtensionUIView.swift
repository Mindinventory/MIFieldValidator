//
//  ExtensionUIView.swift
//  ValidationsDemo
//
//  Created by Mind on 14/07/21.
//  Copyright © 2021 Mac-0008. All rights reserved.
//

import UIKit

extension UIView {

    func configShadowAndBorder() {
        self.applyCircle()
        self.dropShadow(shadowRadius: 10)
        self.addBorder(width: 0.25)
        self.backgroundColor = .white
    }

    func dropShadow(shadowRadius: CGFloat = 0.0) {
        layer.shadowColor = UIColor(named: CshadowColor)!.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0.4
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }

    func addBorder(width: CGFloat) {
        self.layer.borderColor = UIColor(named: CshadowColor)!.withAlphaComponent(0.25).cgColor
        self.layer.borderWidth = width
    }

    func applyCircle() {
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width)*0.5
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
}
