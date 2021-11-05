//
// Created by Wellington Alves on 11/08/21.
//

protocol MainPresenterProtocol {
    func showMoviePopularList(_ movies: [Movie])
    func showMovieUpcomingList(_ movies: [Movie])
    func showMovieTopRatedList(_ movies: [Movie])
    func showMoviePlayingNowList(_ movies: [Movie])
}

class MainPresenter: MainPresenterProtocol {
    weak var viewController: MainViewController?

    func showMoviePopularList(_ movies: [Movie]) {
        viewController?.showMoviePopularList(movies)
    }

    func showMovieUpcomingList(_ movies: [Movie]) {
        viewController?.showMovieUpcomingList(movies)
    }

    func showMovieTopRatedList(_ movies: [Movie]) {
        viewController?.showMovieTopRatedList(movies)
    }

    func showMoviePlayingNowList(_ movies: [Movie]) {
        viewController?.showMoviePlayingNowList(movies)
    }
}
