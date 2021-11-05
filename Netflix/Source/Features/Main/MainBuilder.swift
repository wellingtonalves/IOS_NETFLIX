//
// Created by Wellington Alves on 09/08/21.
//


import UIKit

class MainBuilder {

    static func build() -> UIViewController {
        let viewController = MainViewController()
        let router = MainRouter()
        let interactor = MainInteractor()
        let presenter = MainPresenter()

        viewController.router = router
        viewController.interactor = interactor
        router.viewController = viewController
        router.dataStore = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        return viewController
    }
}
