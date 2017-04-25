//
//  UIDiagonalViewCell.swift
//  UIKitCatalog
//
//  Created by Reza Shirazian on 2017-04-15.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class UIDiagonalViewCell: UIView {

    var widthConstraint: NSLayoutConstraint?
    var topConstraint: NSLayoutConstraint?
    var leftConstraint: NSLayoutConstraint?
    var bottomConstraint: NSLayoutConstraint?
    var content = [UIView]()
    var index: Int?
    var offset: Double?
    let DEVICE_WIDTH = 1920.0
    let DEVICE_HEIGHT = 1080.0

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func didSetupCell() {
        
    }
    
    func didSetupConstraints() {
        
    }
    
   
    override var canBecomeFocused: Bool {
        return true
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {

    }
    
    
    func selectThisCell(_ completion: (() -> ())? = nil) {
        if let completion = completion {
            completion()
        }
    }
    
}


