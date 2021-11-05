//
// Created by Wellington Alves on 09/08/21.
//

import UIKit

class MainView: UIView {

    private let delegate: MovieViewDelegate
    private var moviePopularList: [Movie] = []
    private var movieUpcomingList: [Movie] = []
    private var movieTopRatedList: [Movie] = []
    private var moviePlayingNowList: [Movie] = []
    private let pageStackView: UIStackView = UIStackView()
    private let pageScroll: UIScrollView = UIScrollView()

    var layout: UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 110, height: 165)
        return layout
    }

    private lazy var cardFeatured: CardFeatured = {
        let card = CardFeatured()
        card.cardImage = UIImageView()
        return card
    }()

    var movieCollectionMostPopular: UICollectionView!
    var movieCollectionMostPopularDataSource: UICollectionViewDataSource? {
        didSet {
            self.movieCollectionMostPopular = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.maxX, height: 200), collectionViewLayout: self.layout)
            self.movieCollectionMostPopular.register(MovieCell.self, forCellWithReuseIdentifier: "cell")
            self.movieCollectionMostPopular.dataSource = movieCollectionMostPopularDataSource
            self.movieCollectionMostPopular.delegate = self
            self.movieCollectionMostPopular.reloadData()
        }
    }

    var movieCollectionUpcoming: UICollectionView!
    var movieCollectionUpcomingDataSource: UICollectionViewDataSource? {
        didSet {
            self.movieCollectionUpcoming = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.maxX, height: 200), collectionViewLayout: self.layout)
            self.movieCollectionUpcoming.register(MovieCell.self, forCellWithReuseIdentifier: "cell")
            self.movieCollectionUpcoming.dataSource = movieCollectionUpcomingDataSource
            self.movieCollectionUpcoming.delegate = self
            self.movieCollectionUpcoming.reloadData()
        }
    }

    var movieCollectionTopRated: UICollectionView!
    var movieCollectionTopRatedDataSource: UICollectionViewDataSource? {
        didSet {
            self.movieCollectionTopRated = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.maxX, height: 200), collectionViewLayout: self.layout)
            self.movieCollectionTopRated.register(MovieCell.self, forCellWithReuseIdentifier: "cell")
            self.movieCollectionTopRated.dataSource = movieCollectionTopRatedDataSource
            self.movieCollectionTopRated.delegate = self
            self.movieCollectionTopRated.reloadData()
        }
    }

    var movieCollectionPlaying: UICollectionView!
    var movieCollectionPlayingDataSource: UICollectionViewDataSource? {
        didSet {
            self.movieCollectionPlaying = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.maxX, height: 200), collectionViewLayout: self.layout)
            self.movieCollectionPlaying.register(MovieCell.self, forCellWithReuseIdentifier: "cell")
            self.movieCollectionPlaying.dataSource = movieCollectionPlayingDataSource
            self.movieCollectionPlaying.delegate = self
            self.movieCollectionPlaying.reloadData()
        }
    }

    init(delegate: MovieViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
        getRandomMovie()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupPopularList(_ movies: [Movie]) {
        self.moviePopularList = movies
        movieCollectionMostPopularDataSource = MovieCollectionPopularController(movies: movies)
        addCollectionPopular()
    }

    func setupUpcomingList(_ movies: [Movie]) {
        self.movieUpcomingList = movies
        movieCollectionUpcomingDataSource = MovieCollectionPopularController(movies: movies)
        addCollectionUpcoming()
    }

    func setupTopRatedList(_ movies: [Movie]) {
        self.movieTopRatedList = movies
        movieCollectionTopRatedDataSource = MovieCollectionPopularController(movies: movies)
        addCollectionTopRated()
    }

    func setupPlayingNowList(_ movies: [Movie]) {
        self.moviePlayingNowList = movies
        movieCollectionPlayingDataSource = MovieCollectionPopularController(movies: movies)
        addCollectionPlayingNow()
    }


    func setupUI() {
        let content = UIView(frame: .zero)

        pageStackView.axis = .vertical
        pageStackView.alignment = .top
        pageStackView.addArrangedSubview(cardFeatured)
        content.addSubview(pageStackView)
        pageScroll.addSubview(content)
        self.addSubview(pageScroll)

        pageScroll.translatesAutoresizingMaskIntoConstraints = false
        content.translatesAutoresizingMaskIntoConstraints = false
        pageStackView.translatesAutoresizingMaskIntoConstraints = false
        cardFeatured.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            pageScroll.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            pageScroll.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            pageScroll.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            pageScroll.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),

            content.topAnchor.constraint(equalTo: pageScroll.topAnchor),
            content.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            content.bottomAnchor.constraint(equalTo: pageScroll.bottomAnchor),
            content.heightAnchor.constraint(equalToConstant: 1300),

            pageStackView.topAnchor.constraint(equalTo: content.topAnchor),
            pageStackView.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            pageStackView.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            pageStackView.bottomAnchor.constraint(equalTo: content.bottomAnchor),

            cardFeatured.topAnchor.constraint(equalTo: content.topAnchor, constant: 0),
            cardFeatured.heightAnchor.constraint(equalToConstant: 200),
            cardFeatured.widthAnchor.constraint(equalTo: content.widthAnchor),
        ])
    }

    private func addCollectionPopular() {
        let stackView = UIStackView()

        if let collection = movieCollectionMostPopular {
            stackView.addSubview(collection)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            pageStackView.addArrangedSubview(stackView)

            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: pageStackView.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: pageStackView.trailingAnchor),
                stackView.heightAnchor.constraint(equalToConstant: 250),
            ])
        }
    }

    private func addCollectionPlayingNow() {
        let stackView = UIStackView()

        if let collection = movieCollectionPlaying {
            stackView.addSubview(collection)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            pageStackView.addArrangedSubview(stackView)

            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: pageStackView.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: pageStackView.trailingAnchor),
                stackView.heightAnchor.constraint(equalToConstant: 250),
            ])
        }
    }

    private func addCollectionUpcoming() {
        let stackView = UIStackView()

        if let collection = movieCollectionUpcoming {
            stackView.addSubview(collection)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            pageStackView.addArrangedSubview(stackView)

            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: pageStackView.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: pageStackView.trailingAnchor),
                stackView.heightAnchor.constraint(equalToConstant: 250),
            ])
        }
    }

    private func addCollectionTopRated() {
        let stackView = UIStackView()

        if let collection = movieCollectionTopRated {
            stackView.addSubview(collection)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            pageStackView.addArrangedSubview(stackView)

            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: pageStackView.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: pageStackView.trailingAnchor),
                stackView.heightAnchor.constraint(equalToConstant: 250),
            ])
        }
    }


    private func showAnimation() {
        UIView.animate(withDuration: 2,
                delay: 0.5,
                usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5,
                options: [],
                animations: { [weak self] in
                    self?.cardFeatured.animationStart()
                }) { (_) in
            UIView.animate(withDuration: 2, delay: 3, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5) {
                self.cardFeatured.animationEnd()
            }
        }
    }

    func getRandomMovie(){
        let movie = self.moviePopularList.randomElement()

        if let imageTemp = movie?.backdrop_path {
            let urlImage = "https://image.tmdb.org/t/p/w500\(imageTemp)"
            self.cardFeatured.cardImage?.load(url: urlImage)
        }
        self.cardFeatured.cardTitle = movie?.title
        self.cardFeatured.cardDescription = movie?.overview
        self.cardFeatured.make()
        self.showAnimation()
    }
}

extension MainView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == movieCollectionUpcoming {
            delegate.selectUpcoming(at: indexPath.row)
        }

        if collectionView == movieCollectionTopRated {
            delegate.selectTopRated(at: indexPath.row)
        }

        if collectionView == movieCollectionMostPopular {
            delegate.selectPopular(at: indexPath.row)
        }

        if collectionView == movieCollectionPlaying {
            delegate.selectPLayingNow(at: indexPath.row)
        }
    }
}