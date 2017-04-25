//
//  DiagonalCustomViewController.swift
//  UIKitCatalog
//
//  Created by Reza Shirazian on 2017-04-15.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class DiagonalTVShowViewController: UIViewController, UIDiagonalDelegate {
    
    var diagonal: UIDiagonalView?
    var selectedTVShow: TVShowItem?
    
    private var dataItems = [TVShowItem(title: "The Mindy Project", hero: "diag_mindy", logo: "diag_mindy_logo"),
                             TVShowItem(title: "Brooklyn Nine Nine", hero: "diag_andy", logo: "diag_brooklyn_logo"),
                             TVShowItem(title: "Modern Family", hero: "diag_sofia", logo: "diag_modern_logo"),
                             TVShowItem(title: "Empire", hero: "diag_terrence", logo: "diag_empire_logo"),
                             TVShowItem(title: "Nashville", hero: "diag_connie", logo: "diag_nash_logo"),
                             TVShowItem(title: "South Park", hero: "diag_cartman", logo: "diag_southpark_logo"),
                             TVShowItem(title: "Law & Order", hero: "diag_mariska", logo: "diag_laworder_logo")]
    
//    private var dataItems = [TVShowItem(title: "The Mindy Project", hero: "diag_mindy", logo: "diag_mindy_logo"),
//                             TVShowItem(title: "Brooklyn Nine Nine", hero: "diag_andy", logo: "diag_brooklyn_logo")]
//    
//    private var dataItems = [TVShowItem(title: "The Mindy Project", hero: "diag_mindy", logo: "diag_mindy_logo"),
//                             TVShowItem(title: "Brooklyn Nine Nine", hero: "diag_andy", logo: "diag_brooklyn_logo"),
//                             TVShowItem(title: "Modern Family", hero: "diag_sofia", logo: "diag_modern_logo"),
//                             TVShowItem(title: "Empire", hero: "diag_terrence", logo: "diag_empire_logo"),
//                             TVShowItem(title: "Nashville", hero: "diag_connie", logo: "diag_nash_logo")]
    
    private var backgroundColors = [UIColor(red: CGFloat(0.7), green: CGFloat(0.7), blue: CGFloat(0.7), alpha: 1.0),
                                    UIColor(red: CGFloat(0.25), green: CGFloat(0.25), blue: CGFloat(0.25), alpha: 1.0),
                                    UIColor(red: CGFloat(0.62), green: CGFloat(0.62), blue: CGFloat(0.62), alpha: 1.0),
                                    UIColor(red: CGFloat(0.5), green: CGFloat(0.5), blue: CGFloat(0.5), alpha: 1.0),
                                    UIColor(red: CGFloat(0.71), green: CGFloat(0.71), blue: CGFloat(0.71), alpha: 1.0),
                                    UIColor(red: CGFloat(0.36), green: CGFloat(0.36), blue: CGFloat(0.36), alpha: 1.0),
                                    UIColor(red: CGFloat(0.77), green: CGFloat(0.77), blue: CGFloat(0.77), alpha: 1.0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDiagonal()
    }
    
    
    func setDiagonal() {
        let view = UIDiagonalView()
        view.delegate = self
        self.view.addSubview(view)
        self.diagonal = view
        view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func diagonalView(_ diagonalView: UIDiagonalView, cellForRowAt indexPath: Int) -> UIDiagonalViewCell {
        return DigonalTvShowCell(hero: dataItems[indexPath].hero, logo: dataItems[indexPath].logo, backgroundColor: backgroundColors[indexPath])
    }
    
    func diagonalView(_ diagonalView: UIDiagonalView, didSelectRowAt indexPath: Int) {
        if let cell = diagonalView.rowAtIndex(index: indexPath) {
            self.selectedTVShow = self.dataItems[indexPath]
            cell.selectThisCell() {
                self.performSegue(withIdentifier: "segueToShow", sender: self)
                print("transition to \(self.dataItems[indexPath].title)")
            }
        }
    }
    
    func numberOfCells(_ diagonalView: UIDiagonalView) -> Int {
        return dataItems.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if let selectedTVShow = self.selectedTVShow, let destination = segue.destination as? TVShowDetailsViewController {
            destination.heroImage = selectedTVShow.hero
            destination.logoImage = selectedTVShow.logo
        }
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
