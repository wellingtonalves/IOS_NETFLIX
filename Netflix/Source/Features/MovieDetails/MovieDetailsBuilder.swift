//
// Created by Wellington Alves on 09/08/21.
//

import UIKit

struct MovieDetailsBuilder {
    static func builder(_ movie: Movie) -> UIViewController {
     let viewController = MovieDetailsViewController()
        let interactor = MovieDetailsInteractor()
        let presenter = MovieDetailsPresenter()

        viewController.interactor = interactor
        interactor.movie = movie
        interactor.presenter = presenter
        presenter.viewController = viewController

        return viewController
    }
}
