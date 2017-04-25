//
//  DiagonalTVShowCell.swift
//  DiagonalCategory
//
//  Created by Reza Shirazian on 4/25/17.
//  Copyright © 2017 Reza Shirazian. All rights reserved.
//

import UIKit

class DigonalTvShowCell: UIDiagonalViewCell {
    
    var hero: UIImageView?
    var heroBw: UIImageView?
    var logo: UIImageView?
    var bg: UIView?
    var heroLeftConstraint: NSLayoutConstraint?
    var logoLeftConstraint: NSLayoutConstraint?
    var bgTopConstraint: NSLayoutConstraint?
    
    init(hero: String, logo: String, backgroundColor: UIColor) {
        super.init(frame: CGRect.zero)
        self.hero = UIImageView(image: UIImage(named: hero))
        self.logo = UIImageView(image: UIImage(named: logo))
        self.bg = UIView()
        self.bg?.backgroundColor = UIColor(red: 99/250.0, green: 171/255.0, blue: 39/255.0, alpha: 1.0)
        
        self.heroBw = UIImageView(image: self.getBlackAndWhiteImage(image: self.hero!.image!))
        
        self.hero!.translatesAutoresizingMaskIntoConstraints = false
        self.logo!.translatesAutoresizingMaskIntoConstraints = false
        self.heroBw!.translatesAutoresizingMaskIntoConstraints = false
        self.bg!.translatesAutoresizingMaskIntoConstraints = false
        
        self.logo!.contentMode = .scaleAspectFit
        self.hero!.contentMode = .scaleAspectFill
        self.heroBw!.contentMode = .scaleAspectFill
        self.heroBw!.alpha = 1.0
        self.hero!.alpha = 1.0
        
        self.addSubview(self.hero!)
        self.addSubview(self.logo!)
        self.addSubview(self.heroBw!)
        self.addSubview(self.bg!)
        
        self.content.append(self.hero!)
        self.content.append(self.logo!)
        self.content.append(self.heroBw!)
        
        self.backgroundColor = backgroundColor
        
        self.logo!.layer.zPosition = 5
        self.heroBw!.layer.zPosition = 4
        self.hero!.layer.zPosition = 3
        self.bg!.layer.zPosition = 2
        self.layoutImages()
        self.clipsToBounds = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func getBlackAndWhiteImage(image: UIImage) -> UIImage {
        let ciimage = CIImage.init(cgImage: image.cgImage!)
        let filter = CIFilter.init(name: "CIColorControls")
        filter?.setValue(ciimage, forKey: kCIInputImageKey)
        filter?.setValue(0.0, forKey: kCIInputSaturationKey)
        let result = filter?.value(forKey: kCIOutputImageKey) as! CIImage
        let cgimage = CIContext.init(options: nil).createCGImage(result, from: result.extent)
        let image = UIImage.init(cgImage: cgimage!)
        return image
    }
    
    func layoutImages() {
        if let hero = self.hero {
            //let centerX = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: hero, attribute: .centerX, multiplier: 1.0, constant: 0)
            let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: hero, attribute: .bottom, multiplier: 1.0, constant: 0)
//            let trailing = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: hero, attribute: .trailing, multiplier: 1.0, constant: 0)
            let leading = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: hero, attribute: .leading, multiplier: 1.0, constant: -30)
            let centerX = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: hero, attribute: .centerX, multiplier: 1.0, constant:  -30)
            let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: hero, attribute: .top, multiplier: 1.0, constant: -100)
            heroLeftConstraint = leading
            self.addConstraints([bottom, centerX, top])
        }
        
        if let heroBw = self.heroBw {
            //let centerX = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: hero, attribute: .centerX, multiplier: 1.0, constant: 0)
            let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: heroBw, attribute: .bottom, multiplier: 1.0, constant: 0)
//            let trailing = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: heroBw, attribute: .trailing, multiplier: 1.0, constant: 0)
            let centerX = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: heroBw, attribute: .centerX, multiplier: 1.0, constant:  -30)
//            let leading = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: heroBw, attribute: .leading, multiplier: 1.0, constant: -30)
            let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: heroBw, attribute: .top, multiplier: 1.0, constant: -100)
            self.addConstraints([bottom, centerX, top])
        }
        
        if let logo = self.logo {
            let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: logo, attribute: .bottom, multiplier: 1.0, constant: 0)
            let trailing = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: logo, attribute: .trailing, multiplier: 1.0, constant: 0)
            let leading = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: logo, attribute: .leading, multiplier: 1.0, constant: 0)
            //let centerX = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: logo, attribute: .centerX, multiplier: 1.0, constant: 1.0)
            //let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: hero, attribute: .top, multiplier: 1.0, constant: 0)
            logoLeftConstraint = leading
            self.addConstraints([bottom, leading, trailing])
        }
        
        if let bg = self.bg {
            let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: bg, attribute: .bottom, multiplier: 1.0, constant: 0)
            let trailing = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: bg, attribute: .trailing, multiplier: 1.0, constant: 0)
            let leading = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: bg, attribute: .leading, multiplier: 1.0, constant: 0)
            let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: bg, attribute: .top, multiplier: 1.0, constant: 0)
            bg.transform = CGAffineTransform( translationX: 0.0, y: CGFloat(self.DEVICE_HEIGHT))
            self.bgTopConstraint = top
            self.addConstraints([bottom, trailing, leading, top])
        }
    }
    
    override func didSetupCell() {
        if let logoLeftConstraint = self.logoLeftConstraint, let index = self.index, let offset = self.offset  {
            let ratio = index == 0 ? 0.5 : 0.75
            logoLeftConstraint.constant = logoLeftConstraint.constant + CGFloat(offset) * CGFloat(ratio)
        }
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        self.layer.removeAllAnimations()
        self.heroBw!.layer.removeAllAnimations()
        self.hero?.layer.removeAllAnimations()
        if context.nextFocusedView == self {
            
            coordinator.addCoordinatedAnimations({
                self.heroBw!.alpha = 0.0
                
                let duration = UIView.inheritedAnimationDuration
                UIView.animate(withDuration: duration * 1.5, delay: 0.0, options: .overrideInheritedDuration, animations: {
                    self.bg!.transform = CGAffineTransform( translationX: 0.0, y: 0)
                    self.superview!.transform = CGAffineTransform(scaleX: 1.2, y: 1.0)
                    self.content.forEach {$0.transform = CGAffineTransform(scaleX: 1.0/1.2, y: 1.0)}
                    self.layoutIfNeeded()
                }, completion: { (completed: Bool) in
                    // Completion block
                })
                
            }, completion: {})
            
            
        } else if context.previouslyFocusedView == self {
            
            coordinator.addCoordinatedAnimations({ () -> Void in
                self.heroBw!.alpha = 1.0
                let duration = UIView.inheritedAnimationDuration
                UIView.animate(withDuration: duration * 1.5, delay: 0.0, options: .overrideInheritedDuration, animations: {
                    self.bg!.transform = CGAffineTransform( translationX: 0.0, y: CGFloat(self.DEVICE_HEIGHT))
                    self.superview!.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    self.content.forEach {$0.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)}
                    self.layoutIfNeeded()
                }, completion: { (completed: Bool) in
                    // Completion block
                })
                
                
            }, completion: {})
        }
    }
    
    override func selectThisCell(_ completion: (() -> ())? = nil) {
        //perform custom animations
        if let completion = completion {
            completion()
        }
//        let ratio = (CGFloat(DEVICE_WIDTH) / self.layer.frame.width) * 4.0
//        self.superview!.layer.zPosition = 10
//        let x = self.convert(self.layer.position, to: self.superview!.superview!).x
//        self.widthConstraint?.constant = self.layer.frame.width * 2
//        self.leftConstraint?.constant = -CGFloat(self.layer.frame.width)
//        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
//            self.superview!.superview!.layoutIfNeeded()
//        }, completion: {(done) in
//            if let completed = completion {
//                completed()
//            }
//        })
    }
    

}


