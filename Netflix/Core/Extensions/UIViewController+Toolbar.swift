//
//  UIViewController+Toolbar.swift
//  Netflix
//
//  Created by Wellington Alves on 29/07/21.
//

import UIKit

extension UIViewController {
    func showToolbar() {
        let logo = UIImageView(image: UIImage(named: "netflix-s-bg"))
        let stackView = UIStackView(arrangedSubviews: [logo])
        logo.contentMode = .scaleAspectFit
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 30),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logo.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
