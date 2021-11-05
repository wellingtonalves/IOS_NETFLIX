//
// Created by Wellington Alves on 09/08/21.
//

protocol MovieDetailsPresenterProtocol {
    var viewController: MovieDetailsViewControllerProtocol! { get set}
    func showMovieDetails(_ movie: Movie)
}

class MovieDetailsPresenter: MovieDetailsPresenterProtocol {
    var viewController: MovieDetailsViewControllerProtocol!

    func showMovieDetails(_ movie: Movie) {
        viewController.showVideoDetail(movie)
    }
}
