//
//  NibView.swift
//  ValidationsDemo
//
//  Created by mind-0023 on 19/07/21.
//  Copyright © 2021 Mac-0008. All rights reserved.
//

import UIKit

//MARK: - Class to load view nib file -
class NibView: UIView {

    private var contentView: UIView!
    var nibName: String {
        return String(describing: type(of: self))
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }

    //MARK:- loadViewFromNib -
    func loadViewFromNib() {
        contentView = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?[0] as? UIView
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.frame = bounds
        addSubview(contentView)
    }
}
