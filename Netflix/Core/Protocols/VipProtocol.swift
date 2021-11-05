//
// Created by Wellington Alves on 09/08/21.
//

protocol InteractorProtocol {
}

protocol RouterProtocol {
}

protocol VipProtocol {
    var interactor: InteractorProtocol { get set }
    var router: RouterProtocol? { get set }
}