////
////  MainViewController2.swift
////  Netflix
////
////  Created by Wellington Alves on 23/07/21.
////
//
//import UIKit
//import Kingfisher
//import AVFoundation
//
//class MainViewController2: UIViewController {
//
//    var scrollView = UIScrollView()
//    var contentView = UIView()
//    var collectionView: UICollectionView!
//    var collectionView2: UICollectionView!
//    var collectionView3: UICollectionView!
//    var collectionView4: UICollectionView!
//    var viewTimer: Timer!
//
//    var movies: [Movie] = [Movie]()
//    var moviesAction: [Movie] = [Movie]()
//    var moviesTopRated: [Movie] = [Movie]()
//    var moviesPlayingNow: [Movie] = [Movie]()
//
//    private var layout: UICollectionViewFlowLayout {
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 110, height: 165)
//        return layout
//    }
//
//    private lazy var cardFeatured: CardFeatured = {
//        let card = CardFeatured()
//        card.cardImage = UIImageView()
//        return card
//    }()
//
//    let movieWorker: MovieWorker = MovieWorker()
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        getVideos()
//        getActionMovies()
//        getTopRatedMovies()
//        getPlayingNowMovies()
//    }
//
//    func setupScrollView() {
//        contentView.backgroundColor = .clear
//        scrollView.delegate = self
//          self.scrollView.contentOffset.y = self.yOffset
//        view.addSubview(scrollView)
//        scrollView.addSubview(contentView)
//        scrollView.backgroundColor = .clear
//
////        scrollView.showsVerticalScrollIndicator = false
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            contentView.heightAnchor.constraint(equalToConstant: 1200), //TODO
//            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//        ])
//
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Início"
//        view.backgroundColor = .black
//        contentView.addSubview(cardFeatured)
//
//        let moviesPopularTitle = UILabel()
//        let moviesUpcomingTitle = UILabel()
//        let moviesActionTitle = UILabel()
//        let moviesNewTitle = UILabel()
//        moviesPopularTitle.text = "Filmes que estão em alta"
//        moviesPopularTitle.textColor = .white
//        moviesPopularTitle.font = UIFont(name: "Roboto", size: 20)
//        moviesUpcomingTitle.text = "Novos no pedaço"
//        moviesUpcomingTitle.textColor = .white
//        moviesUpcomingTitle.font = UIFont(name: "Roboto", size: 20)
//        moviesActionTitle.text = "Galera gostou muito"
//        moviesActionTitle.textColor = .white
//        moviesActionTitle.font = UIFont(name: "Roboto", size: 20)
//        moviesNewTitle.text = "Nos cinemas"
//        moviesNewTitle.textColor = .white
//        moviesNewTitle.font = UIFont(name: "Roboto", size: 20)
//
//        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: self.layout)
//        self.collectionView.backgroundColor = UIColor.black
//        self.collectionView.delegate = self
//        self.collectionView.dataSource = self
//        self.collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cell")
//        self.collectionView.reloadData()
//
//        self.collectionView2 = UICollectionView(frame: self.view.frame, collectionViewLayout: self.layout)
//        self.collectionView2.backgroundColor = UIColor.black
//        self.collectionView2.delegate = self
//        self.collectionView2.dataSource = self
//        self.collectionView2.register(VideoCell.self, forCellWithReuseIdentifier: "cell")
//        self.collectionView2.reloadData()
//
//        self.collectionView3 = UICollectionView(frame: self.view.frame, collectionViewLayout: self.layout)
//        self.collectionView3.backgroundColor = UIColor.black
//        self.collectionView3.delegate = self
//        self.collectionView3.dataSource = self
//        self.collectionView3.register(VideoCell.self, forCellWithReuseIdentifier: "cell")
//        self.collectionView3.reloadData()
//
//        self.collectionView4 = UICollectionView(frame: self.view.frame, collectionViewLayout: self.layout)
//        self.collectionView4.backgroundColor = UIColor.black
//        self.collectionView4.delegate = self
//        self.collectionView4.dataSource = self
//        self.collectionView4.register(VideoCell.self, forCellWithReuseIdentifier: "cell")
//        self.collectionView4.reloadData()
//
//        let stackCollection = UIStackView(arrangedSubviews: [moviesPopularTitle, collectionView])
//        let stackCollectionUpcoming = UIStackView(arrangedSubviews: [moviesUpcomingTitle, collectionView2])
//        let stackCollectionAction = UIStackView(arrangedSubviews: [moviesActionTitle, collectionView3])
//        let stackCollectionNews = UIStackView(arrangedSubviews: [moviesNewTitle, collectionView4])
//
//        stackCollection.axis = .vertical
//        stackCollectionUpcoming.axis = .vertical
//        stackCollectionAction.axis = .vertical
//        stackCollectionNews.axis = .vertical
//
//        contentView.addSubview(stackCollectionNews)
//        contentView.addSubview(stackCollection)
//        contentView.addSubview(stackCollectionUpcoming)
//        contentView.addSubview(stackCollectionAction)
//        showToolbar()
//        setupScrollView()
//
//        stackCollection.translatesAutoresizingMaskIntoConstraints = false
//        stackCollectionUpcoming.translatesAutoresizingMaskIntoConstraints = false
//        stackCollectionAction.translatesAutoresizingMaskIntoConstraints = false
//        stackCollectionNews.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            stackCollectionNews.topAnchor.constraint(equalTo: cardFeatured.bottomAnchor, constant: 80),
//            stackCollectionNews.leadingAnchor.constraint(equalTo: cardFeatured.leadingAnchor),
//            stackCollectionNews.trailingAnchor.constraint(equalTo: cardFeatured.trailingAnchor),
//            stackCollectionNews.heightAnchor.constraint(equalToConstant: 190),
//
//            stackCollection.topAnchor.constraint(equalTo: stackCollectionNews.bottomAnchor, constant: 40),
//            stackCollection.leadingAnchor.constraint(equalTo: stackCollectionNews.leadingAnchor),
//            stackCollection.trailingAnchor.constraint(equalTo: stackCollectionNews.trailingAnchor),
//            stackCollection.heightAnchor.constraint(equalToConstant: 190),
//
//            stackCollectionUpcoming.topAnchor.constraint(equalTo: stackCollection.bottomAnchor, constant: 40),
//            stackCollectionUpcoming.widthAnchor.constraint(equalTo: stackCollection.widthAnchor),
//            stackCollectionUpcoming.heightAnchor.constraint(equalToConstant: 190),
//
//            stackCollectionAction.topAnchor.constraint(equalTo: stackCollectionUpcoming.bottomAnchor, constant: 40),
//            stackCollectionAction.widthAnchor.constraint(equalTo: stackCollectionUpcoming.widthAnchor),
//            stackCollectionAction.heightAnchor.constraint(equalToConstant: 190),
//        ]);
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        viewTimer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { timer in
//            self.getVideos()
//        }
//    }
//
//    private func showAnimation() {
//        UIView.animate(withDuration: 2,
//                delay: 0.5,
//                usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5,
//                options: [],
//                animations: { [weak self] in
//                    self?.cardFeatured.animationStart()
//                }) { (_) in
//            UIView.animate(withDuration: 2, delay: 3, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5) {
//                self.cardFeatured.animationEnd()
//            }
//        }
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        setupConstraints()
//    }
//
//    func getVideos() {
//        movieWorker.getPopular { result in
//            switch result {
//            case .success(let movies):
//                self.movies = movies.results
//                self.collectionView.reloadData()
//                let movie = self.movies.randomElement()
//
//                if let imageTemp = movie?.backdrop_path {
//                    let urlImage = "https://image.tmdb.org/t/p/w500\(imageTemp)"
//                    self.cardFeatured.cardImage?.load(url: urlImage)
//                }
//                self.cardFeatured.cardTitle = movie?.title
//                self.cardFeatured.cardDescription = movie?.overview
//                self.cardFeatured.make()
//                self.showAnimation()
//            case .failure(_):
//                print("Error")
//            }
//        }
//    }
//
//    private func getActionMovies() {
//        movieWorker.getUpcoming { result in
//            switch result {
//            case .success(let movies):
//                self.moviesAction = movies.results
//                self.collectionView2.reloadData()
//            case .failure(_):
//                print("Error")
//            }
//        }
//    }
//
//    private func getTopRatedMovies() {
//        movieWorker.getTopRated { result in
//            switch result {
//            case .success(let movies):
//                self.moviesTopRated = movies.results.reversed()
//                self.collectionView3.reloadData()
//            case .failure(_):
//                print("Error")
//            }
//        }
//    }
//
//    private func getPlayingNowMovies() {
//        movieWorker.getPlayingNow { result in
//            switch result {
//            case .success(let movies):
//                self.moviesPlayingNow = movies.results.reversed()
//                self.collectionView4.reloadData()
//            case .failure(_):
//                print("Error")
//            }
//        }
//    }
//
//    private func setupConstraints() {
//        cardFeatured.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            cardFeatured.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
//            cardFeatured.heightAnchor.constraint(equalToConstant: 200),
//            cardFeatured.widthAnchor.constraint(equalTo: contentView.widthAnchor),
//        ])
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        viewTimer.invalidate()
//    }
//}
//
//extension MainViewController2: UICollectionViewDelegate {
//}
//
//extension MainViewController2: UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.movies.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell: VideoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! VideoCell
//        if collectionView == self.collectionView {
//            let movie: Movie = movies[indexPath.row]
//            let urlImage = "https://image.tmdb.org/t/p/w200\(movie.poster_path)"
//            cell.poster?.load(url: urlImage)
//        }
//
//        if collectionView == self.collectionView2 {
//            let movie: Movie = moviesAction[indexPath.row]
//            let urlImage = "https://image.tmdb.org/t/p/w200\(movie.poster_path)"
//            cell.poster?.load(url: urlImage)
//        }
//
//        if collectionView == self.collectionView3 {
//            let movie: Movie = moviesTopRated[indexPath.row]
//            let urlImage = "https://image.tmdb.org/t/p/w200\(movie.poster_path)"
//            cell.poster?.load(url: urlImage)
//        }
//
//        if collectionView == self.collectionView4 {
//            let movie: Movie = moviesPlayingNow[indexPath.row]
//            let urlImage = "https://image.tmdb.org/t/p/w200\(movie.poster_path)"
//            cell.poster?.load(url: urlImage)
//        }
//
//        return cell
//    }
//}
//
//extension MainViewController2: UIScrollViewDelegate {
//    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
////   TODO
//    }
//}