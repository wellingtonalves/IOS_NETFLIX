//
//  TabBarViewController.swift
//  Netflix
//
//  Created by Wellington Alves on 29/07/21.
//

import UIKit


protocol TabBarProtocol {
    func build() -> Void
}

class TabBarController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        build()
    }
}

extension TabBarController: TabBarProtocol {

    func build() {

        let tabBar = UITabBarController()
        tabBar.tabBar.barTintColor = .black
        tabBar.tabBar.tintColor = .red
        tabBar.modalPresentationStyle = .fullScreen

        let main = UINavigationController(rootViewController: MainBuilder.build())
        main.navigationBar.prefersLargeTitles = true

        main.title = "Início"
        main.tabBarItem.image = UIImage(systemName: "house")

        let favorites = FavoritesViewController()
        favorites.title = "Favoritos"
        favorites.tabBarItem.image = UIImage(systemName: "star")

        let settings = SettingsViewController()
        settings.title = "Configurações"
        settings.tabBarItem.image = UIImage(systemName: "gear")

        tabBar.setViewControllers([
            main,
            favorites,
            settings
        ], animated: false)

        present(tabBar, animated: false, completion: nil)
    }
}
