//
// Created by Wellington Alves on 10/08/21.
//

protocol MainRouterProtocol {
    func goToMovieDetails()
}

protocol MainDataPassing {
    var dataStore: MainDataSource? { get set }
}

class MainRouter: MainRouterProtocol, MainDataPassing {
    var dataStore: MainDataSource?
    var viewController: MainViewController!

    func goToMovieDetails() {
        guard let movie = dataStore?.movie else {
            return
        }

        let detailScene = MovieDetailsBuilder.builder(movie)
        viewController.navigationController?.pushViewController(detailScene, animated: true)
    }
}