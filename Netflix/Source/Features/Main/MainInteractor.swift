//
// Created by Wellington Alves on 09/08/21.
//
protocol MainDataSource {
    var movie: Movie? { get }
}

protocol MainInteractorProtocol: MainDataSource {
    func getPopularMovies()
    func getUpcomingMovies()
    func getTopRatedMovies()
    func getPlayingNowMovies()
//    func getTrailers()
    func selectMoviePopular(at index: Int)
    func selectMovieTopRated(at index: Int)
    func selectMovieUpcoming(at index: Int)
    func selectMoviePLayingNow(at index: Int)
}

class MainInteractor: MainInteractorProtocol, MainDataSource {
    private var moviesPopular: [Movie] = []
    private var moviesUpcoming: [Movie] = []
    private var moviesTopRated: [Movie] = []
    private var moviesPlayingNow: [Movie] = []

    var movie: Movie?
    let movieWorker: MovieWorker = MovieWorker() // Movies -> Listagem de filmes
    let itunesWorker: ItunesWorker = ItunesWorker() // TODO Trailers -> Add ao banner principal
    var presenter: MainPresenterProtocol!

    func getPopularMovies() {
        movieWorker.getPopular { [self] result in
            switch result {
            case .success(let movies):
                self.moviesPopular = movies.results
                presenter.showMoviePopularList(movies.results)
            case .failure(let error):
                print(error)
            }
        }
    }

    func getUpcomingMovies() {
        movieWorker.getUpcoming { [self] result in
            switch result {
            case .success(let movies):
                self.moviesUpcoming = movies.results
                presenter.showMovieUpcomingList(movies.results)
            case .failure(let error):
                print(error)
            }
        }
    }

    func getTopRatedMovies() {
        movieWorker.getTopRated { [self] result in
            switch result {
            case .success(let movies):
                self.moviesTopRated = movies.results
                presenter.showMovieTopRatedList(movies.results)
            case .failure(let error):
                print(error)
            }
        }
    }

    func getPlayingNowMovies() {
        movieWorker.getPlayingNow { [self] result in
            switch result {
            case .success(let movies):
                self.moviesPlayingNow = movies.results
                presenter.showMoviePlayingNowList(movies.results)
            case .failure(let error):
                print(error)
            }
        }
    }


//    func getTrailers() {
//        itunesWorker.getAction { [self] result in
//            switch result {
//            case .success(let movies):
////                print(movies.results)
////                self.movies = movies.results
////                presenter.showMovieList(movies.results)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }

    func selectMoviePopular(at index: Int) {
        movie = moviesPopular[index]
    }
    func selectMovieTopRated(at index: Int) {
        movie = moviesTopRated[index]
    }
    func selectMovieUpcoming(at index: Int) {
        movie = moviesUpcoming[index]
    }
    func selectMoviePLayingNow(at index: Int) {
        movie = moviesPlayingNow[index]
    }
}
