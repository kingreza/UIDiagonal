//
//  UIDiagonalDelegate.swift
//  UIKitCatalog
//
//  Created by Reza Shirazian on 2017-04-15.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

protocol UIDiagonalDelegate {
    
    func diagonalView(_ diagonalView: UIDiagonalView, cellForRowAt indexPath: Int) -> UIDiagonalViewCell
    
    func numberOfCells(_ diagonalView: UIDiagonalView) -> Int
    
    func diagonalView(_ diagonalView: UIDiagonalView, didSelectRowAt indexPath: Int)
}
