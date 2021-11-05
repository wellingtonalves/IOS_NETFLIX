//
// Created by Wellington Alves on 06/08/21.
//

import UIKit

protocol MovieDetailsViewControllerProtocol {
    func showVideoDetail(_ movie: Movie)
}

class MovieDetailsViewController: UIViewController {
    var interactor: MovieDetailsInteractor!

    private lazy var movieViewDetailsView: MovieDetailsView = {
        let vc = MovieDetailsView()
        vc.frame = self.view.bounds
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
//        navigationController?.navigationBar.prefersLargeTitles = true
        title = interactor.movie.title
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.red,
            .font: UIFont(name: "Arial", size: 24)!
        ]

//        self.navigationItem.title = interactor.movie.title

//        self.navigationController?.navigationBar.prefersLargeTitles = true

//        self.navigationItem.backButtonTitle = "Voltar"
//        self.navigationItem.largeTitleDisplayMode = .always
        self.view = movieViewDetailsView
        interactor.showMovieDetails()
    }
}


extension MovieDetailsViewController: MovieDetailsViewControllerProtocol {
    func showVideoDetail(_ movie: Movie) {
        movieViewDetailsView.setup(movie)
    }
}
