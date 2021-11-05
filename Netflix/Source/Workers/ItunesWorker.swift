//
// Created by Wellington Alves on 14/08/21.
//

import Foundation

typealias ItunesListResult = (Result<ItunesListResponse, Error>) -> Void


protocol ItunesWorkerProtocol {
    func getAction(onComplete: @escaping ItunesListResult)
    func getRomance(onComplete: @escaping ItunesListResult)
}

struct ItunesWorker: ItunesWorkerProtocol {
    let api: API

    init(){
        self.api = API(baseURL: "https://itunes.apple.com/search")
    }

    func getAction(onComplete: @escaping ItunesListResult) {
        self.api.endpoint = "?term=action&entity=movie&attribute=genreTerm"
        api.get() { result in
            onComplete(result)
        }
    }

    func getRomance(onComplete: @escaping ItunesListResult) {
        self.api.endpoint = "?term=romance&entity=movie&attribute=genreTerm"
        api.get() { result in
            onComplete(result)
        }
    }
}