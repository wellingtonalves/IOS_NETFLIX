//
// Created by Wellington Alves on 09/08/21.
//


protocol MovieDetailsInteractorProtocol {
    func showMovieDetails()
}

class MovieDetailsInteractor: MovieDetailsInteractorProtocol {
    var presenter:MovieDetailsPresenterProtocol!
    var movie: Movie!

    func showMovieDetails() {
        presenter.showMovieDetails(movie)
    }
}

