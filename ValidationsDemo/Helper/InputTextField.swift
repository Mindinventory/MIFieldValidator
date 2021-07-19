//
//  InputTextField.swift
//  ValidationsDemo
//
//  Created by mind-0023 on 16/07/21.
//  Copyright © 2021 Mac-0008. All rights reserved.
//

import UIKit

//MARK: - Configuration of Textifelds -
final class InputTextField : UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }

    // Method for Configuring UI
    private func configUI() {
        self.configShadowAndBorder()
        self.setEmptyLeftView(WithPadding: 40)
        self.setEmptyRightView(WithPadding: 20)
    }
}
