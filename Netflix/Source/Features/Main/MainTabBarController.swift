//
//  MainTabBarController.swift
//  Netflix
//
//  Created by Wellington Alves on 23/07/21.
//

import UIKit


class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setColors()
    }
    
    func setColors() {
        self.tabBar.unselectedItemTintColor = .secondary
    }
}
