//
// Created by Wellington Alves on 09/08/21.
//

protocol MovieViewDelegate: AnyObject {
    func selectPopular(at index: Int)
    func selectTopRated(at index: Int)
    func selectUpcoming(at index: Int)
    func selectPLayingNow(at index: Int)
}
