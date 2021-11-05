//
// Created by Wellington Alves on 06/08/21.
//

import UIKit
import AVFoundation

class MovieDetailsView: UIView {
    private var player: AVPlayer!
    private var playerLayer: AVPlayerLayer!
    private var stackPlayerView: UIStackView!
    private var title: UILabel!
    private var cover: UIImageView!

    init() {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(_ movie: Movie) {
        backgroundColor = .black
        stackPlayerView = UIStackView(frame: .zero)
        cover = UIImageView()
        cover.contentMode = .scaleToFill
        cover?.load(url: "https://image.tmdb.org/t/p/w500\(movie.backdrop_path)")

//        let url = URL(string: "https://video-ssl.itunes.apple.com/itunes-assets/Video122/v4/d4/e8/9f/d4e89fd9-4e19-67b1-c862-bca3eb167eca/mzvf_6742315108922643512.640x354.h264lc.U.p.m4v")
//        player = AVPlayer(url: url!)
//        playerLayer = AVPlayerLayer(player: player)
////        playerLayer.backgroundColor = UIColor(.yellow).cgColor
//        playerLayer.frame = stackPlayerView.bounds
//        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
//        player.play()

        title = UILabel()
        title.text = movie.title
        title.textColor = .red
        title.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 22)

        stackPlayerView.axis = .vertical
//        stackPlayerView.alignment = .bottom
        stackPlayerView.clipsToBounds = true
//        stackPlayerView.layer.addSublayer(playerLayer)
        stackPlayerView.addArrangedSubview(cover)
//        stackPlayerView.addArrangedSubview(title)
        self.addSubview(stackPlayerView)

        constraints()
//        actionEndOfTrailer()
    }

    private func constraints() {
        stackPlayerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackPlayerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            stackPlayerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackPlayerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackPlayerView.heightAnchor.constraint(equalToConstant: 250),
        ])
    }

    private func actionEndOfTrailer() {
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player.currentItem, queue: .main) { [weak self] _ in
            print("terminou")
//            if let image = self?.cover {
//                self?.addSubview(image)
//            }

//            self?.player?.seek(to: CMTime.zero)
//            self?.player?.play()
        }
    }
}
