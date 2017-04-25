//
//  UIDiagonalView.swift
//  UIKitCatalog
//
//  Created by Reza Shirazian on 2017-04-15.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class UIDiagonalView: UIView {
    
    var delegate: UIDiagonalDelegate?
    let DEVICE_WIDTH = 1920.0
    var rows = [UIDiagonalViewCell]()
    
    private var cellWidth: Double {
        return self.cellChopWidth * (4 / 3)
    }
    
    private var cellChopWidth: Double {
        if let delegate = self.delegate {
            return DEVICE_WIDTH / Double(delegate.numberOfCells(self))
        }
        return 0
    }
    
    private var offset: Double {
        return cellWidth - cellChopWidth
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.red
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.red
    }
    
    override func didMoveToSuperview() {
        initSubviews()
    }
    
    func initSubviews() {
        if let delegate = self.delegate {
            let count = delegate.numberOfCells(self)
            let width = self.cellWidth
            for i in 0..<count {
                let cell = delegate.diagonalView(self, cellForRowAt: i)
                cell.tag = i + 1
                cell.layer.zPosition = CGFloat(count - i)
                cell.index = i
                cell.offset = offset
                cell.didSetupCell()
                
                let container = UIView()
                container.translatesAutoresizingMaskIntoConstraints = false

                container.tag = i + 1
                rows.append(cell)
                container.addSubview(cell)
                container.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
                container.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
                container.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
                container.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
                container.layer.zPosition = CGFloat(count - i)
                container.accessibilityIdentifier = "container"
                
                self.addSubview(container)
                let top = NSLayoutConstraint(item: container,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: self,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: 0)
                
                
                let left = NSLayoutConstraint(item: container,
                                              attribute: .left,
                                              relatedBy: .equal,
                                              toItem: i == 0 ? self : self.subviews.first{$0.tag == i}!,
                                              attribute: i == 0 ? .left : .right,
                                              multiplier: 1.0,
                                              constant: i == 0 ? CGFloat(-self.offset / 2.0) : CGFloat(-self.offset))
                
                let bottom = NSLayoutConstraint(item: container,
                                                attribute: .bottom,
                                                relatedBy: .equal,
                                                toItem: self,
                                                attribute: .bottom,
                                                multiplier: 1.0,
                                                constant: 0)
                
                let width = NSLayoutConstraint(item: container,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1,
                                               constant: CGFloat(width))
                
                
                cell.topConstraint = top
                cell.leftConstraint = left
                cell.bottomConstraint = bottom
                cell.widthConstraint = width
                self.addConstraints([top, left, bottom, width])
                cell.didSetupConstraints()
                
            }
        }
    }
    
    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        for press in presses {
            if (press.type == .select) {
                if let focusedCell = UIScreen.main.focusedView as? UIDiagonalViewCell {
                    if let indexPath = self.indexPath(for: focusedCell) {
                        print("IndexPath is \(indexPath)")
                        if let delegate = self.delegate {
                            delegate.diagonalView(self, didSelectRowAt: indexPath)
                        }
                    }
                }
            }  else {
                super.pressesEnded(presses, with: event)
            }
        }
    }
    
    func rowAtIndex(index: Int) -> UIDiagonalViewCell? {
        return rows[index]
    }
    
    func indexPath(for cell: UIDiagonalViewCell) -> Int? {
        if let row = self.rows.index(where: {$0 === cell}) {
            return row
        }
        return nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let delegate = self.delegate {
            let count = delegate.numberOfCells(self)
            for i in 0..<count - 1 {
                if let container = self.viewWithTag(i + 1) {
                    let mask = CAShapeLayer()
                    mask.frame = container.layer.bounds
                    let width = container.layer.frame.width
                    let height = container.layer.frame.height
                    
                    let path = UIBezierPath()
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: width, y: 0))
                    path.addLine(to: CGPoint(x: CGFloat(self.cellChopWidth), y: height))
                    path.addLine(to: CGPoint(x: 0, y: height))
                    path.close()
                    mask.name = "sliced"
                    mask.path = path.cgPath
                    container.layer.mask = mask
                }
            }
        }
    }
}


