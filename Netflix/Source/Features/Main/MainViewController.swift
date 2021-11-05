//
//  MainViewController.swift
//  Netflix
//
//  Created by Wellington Alves on 23/07/21.
//

import UIKit
import Kingfisher
import AVFoundation

protocol MainViewControllerProtocol {
    func showMoviePopularList(_ movies: [Movie])
    func showMovieUpcomingList(_ movies: [Movie])
    func showMovieTopRatedList(_ movies: [Movie])
    func showMoviePlayingNowList(_ movies: [Movie])
}

class MainViewController: UIViewController {
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!
    var viewTimer: Timer!

    private lazy var movieListView: MainView = {
        return MainView(delegate: self)
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        viewTimer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { timer in
            self.movieListView.getRandomMovie()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }

    private func setupUI() {
        self.navigationController?.isNavigationBarHidden = true
        showToolbar()
    }

    override func loadView() {
        self.view = movieListView
        interactor.getPlayingNowMovies()
        interactor.getTopRatedMovies()
        interactor.getPopularMovies()
        interactor.getUpcomingMovies()
//        interactor.getTrailers()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewTimer.invalidate()
    }
}

extension MainViewController: MovieViewDelegate {
    func selectPopular(at index: Int) {
        interactor.selectMoviePopular(at: index)
        router?.goToMovieDetails()
    }

    func selectTopRated(at index: Int) {
        interactor.selectMovieTopRated(at: index)
        router?.goToMovieDetails()
    }

    func selectUpcoming(at index: Int) {
        interactor.selectMovieUpcoming(at: index)
        router?.goToMovieDetails()
    }

    func selectPLayingNow(at index: Int) {
        interactor.selectMoviePLayingNow(at: index)
        router?.goToMovieDetails()
    }
}

extension MainViewController: MainViewControllerProtocol {
    func showMoviePopularList(_ movies: [Movie]) {
        movieListView.setupPopularList(movies)
    }

    func showMovieUpcomingList(_ movies: [Movie]) {
        movieListView.setupUpcomingList(movies)
    }

    func showMovieTopRatedList(_ movies: [Movie]) {
        movieListView.setupTopRatedList(movies)
    }

    func showMoviePlayingNowList(_ movies: [Movie]) {
        movieListView.setupPlayingNowList(movies)
    }
}