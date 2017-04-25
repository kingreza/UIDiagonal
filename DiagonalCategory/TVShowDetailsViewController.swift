//
//  TVShowDetailsViewController.swift
//  DiagonalCategory
//
//  Created by Reza Shirazian on 4/25/17.
//  Copyright © 2017 Reza Shirazian. All rights reserved.
//

import UIKit

class TVShowDetailsViewController: UIViewController {

    var heroImage: String?
    var logoImage: String?
    
    @IBOutlet weak var hero: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let heroImage = self.heroImage, let logoImage = self.logoImage {
            self.hero.image = UIImage(named: heroImage)
            self.logo.image = UIImage(named: logoImage)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
