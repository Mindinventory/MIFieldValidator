//
//  InputBaseView.swift
//  ValidationsDemo
//
//  Created by Mind on 16/07/21.
//  Copyright © 2021 Mac-0008. All rights reserved.
//

import UIKit

//MARK: - Nib View -
class InputBaseView: NibView {
    //MARK: - Declared Oullets and Variables -
    @IBOutlet private weak var iconContainerView: UIView!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!{
        didSet{
            textField.delegate = self
        }
    }
    @IBInspectable private var iconImage: UIImage!{
        didSet{
            iconImageView.image = iconImage
        }
    }
    @IBInspectable private var placeholderText: String!{
        didSet {
            textField.placeholder = placeholderText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }
    
    //Method to configure UI
    private func configUI() {
        self.layoutIfNeeded()
        iconContainerView.configShadowAndBorder()
    }
}

//MARK: - UITextfield Delegate -
extension InputBaseView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

