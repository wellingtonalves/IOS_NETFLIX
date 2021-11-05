//
//  Card.swift
//  Netflix
//
//  Created by Wellington Alves on 29/07/21.
//

import UIKit

class Card: UIView {
    
    var bgColor: UIColor = .yellow {
        didSet {
            self.layer.borderColor = self.bgColor.cgColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupUI()
    }
    
    private func setupUI(){    
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.cornerRadius = CGFloat(10.0)
        self.layer.backgroundColor = self.bgColor.cgColor
    }
}
