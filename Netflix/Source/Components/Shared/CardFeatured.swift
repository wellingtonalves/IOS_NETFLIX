//
//  CardFeatured.swift
//  Netflix
//
//  Created by Wellington Alves on 30/07/21.
//

import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins
import AVFoundation

class CardFeatured: UIView {

    var cardTitle: String?
    var cardDescription: String?
    var cardImage: UIImageView?
    var cardVideo: AVPlayer?

    private var cardTitleInstance: UILabel!
    private var cardDescriptionInstance: UILabel!
    private var cardImageInstance: UIImageView!
    private var cardVideoInstance: AVPlayer!
    private var stackViewInstance: UIStackView!

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func make() {
        let viewFeatured = UIView()
        let viewOver = UIView()
        viewOver.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        viewFeatured.clipsToBounds = true
        self.cardTitleInstance = UILabel()
        self.cardDescriptionInstance = UILabel()
        self.stackViewInstance = UIStackView(arrangedSubviews: [cardTitleInstance, cardDescriptionInstance])

        if let title = self.cardTitle {
            cardTitleInstance.text = title
            cardTitleInstance.numberOfLines = 1
            cardTitleInstance.font = UIFont(name: "Roboto-Black", size: 30)
            cardTitleInstance.textColor = .red
            cardTitleInstance.alpha = 0
            cardTitleInstance.transform = CGAffineTransform(translationX: 0, y: -10)
        }

        if let description = self.cardDescription {
            cardDescriptionInstance.text = description
            cardDescriptionInstance.font = UIFont.systemFont(ofSize: 16)
            cardDescriptionInstance.numberOfLines = 3
            cardDescriptionInstance.textAlignment = .justified
            cardDescriptionInstance.textColor = .white
            cardDescriptionInstance.alpha = 0
        }

        if let image = self.cardImage {
            cardImageInstance = image
            cardImageInstance?.contentMode = .scaleAspectFill
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor.black.withAlphaComponent(1), UIColor.black.cgColor]
            gradientLayer.frame = CGRect(x: -50, y: 0, width: 400, height: 300)
            gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1)
            viewOver.layer.addSublayer(gradientLayer)
            viewOver.alpha = 1
            viewFeatured.addSubview(cardImageInstance)
            viewFeatured.addSubview(viewOver)
        }

        if let video = self.cardVideo {
            cardVideoInstance = video
            let playerLayer = AVPlayerLayer(player: cardVideoInstance)
            playerLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 200)
            playerLayer.videoGravity = .resizeAspect
            viewFeatured.layer.addSublayer(playerLayer)
            video.play()
        }

        viewFeatured.translatesAutoresizingMaskIntoConstraints = false
        viewOver.translatesAutoresizingMaskIntoConstraints = false
        viewFeatured.backgroundColor = .black
        viewFeatured.addSubview(stackViewInstance)
        addSubview(viewFeatured)

        stackViewInstance.translatesAutoresizingMaskIntoConstraints = false
        cardImageInstance?.translatesAutoresizingMaskIntoConstraints = false
        viewOver.translatesAutoresizingMaskIntoConstraints = false
        stackViewInstance.axis = .vertical
        stackViewInstance.distribution = .fillEqually
        stackViewInstance.alignment = .leading

        NSLayoutConstraint.activate([
            viewFeatured.heightAnchor.constraint(equalToConstant: 250),
            cardImageInstance.widthAnchor.constraint(equalTo: viewFeatured.widthAnchor),
            viewFeatured.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
        ])

        NSLayoutConstraint.activate([
            stackViewInstance.widthAnchor.constraint(equalTo: viewFeatured.widthAnchor, multiplier: 0.95),
            stackViewInstance.centerXAnchor.constraint(equalTo: viewFeatured.centerXAnchor),
            stackViewInstance.bottomAnchor.constraint(equalTo: viewFeatured.bottomAnchor, constant: -20),
        ])
    }

    func animationStart() {
        cardTitleInstance?.transform = CGAffineTransform(translationX: 0, y: 10)
        cardDescriptionInstance.transform = CGAffineTransform(translationX: 0, y: 10)
        cardTitleInstance?.alpha = 1
        cardDescriptionInstance.alpha = 1
    }

    func animationEnd() {
        cardDescriptionInstance.alpha = 0
        cardTitleInstance?.transform = CGAffineTransform(translationX: 0, y: 70)
    }
}
