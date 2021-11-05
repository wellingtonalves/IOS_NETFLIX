//
//  MovieWorker.swift
//  Netflix
//
//  Created by Wellington Alves on 28/07/21.
//

typealias MovieListResult = (Result<MovieListResponse, Error>) -> Void

protocol MovieWorkerProtocol {
    func getPopular(onComplete: @escaping MovieListResult)
}

struct MovieWorker: MovieWorkerProtocol {
    let api: API
    let apiKey: String = "a84792613610f1dfe45a61975c2e5238"

    init(){
        self.api = API(baseURL: "https://api.themoviedb.org/3")
    }
    
    func getPopular(onComplete: @escaping MovieListResult) {
        self.api.endpoint = "/movie/popular?api_key=\(apiKey)&language=en-US"
        api.get() { result in
            onComplete(result)
        }
    }

    func getUpcoming(onComplete: @escaping MovieListResult) {
        self.api.endpoint = "/movie/upcoming?api_key=\(apiKey)&language=en-US"
        api.get() { result in
            onComplete(result)
        }
    }

    func getTopRated(onComplete: @escaping MovieListResult) {
        self.api.endpoint = "/movie/top_rated?api_key=\(apiKey)&language=en-US"
        api.get() { result in
            onComplete(result)
        }
    }

    func getPlayingNow(onComplete: @escaping MovieListResult) {
        self.api.endpoint = "/movie/now_playing?api_key=\(apiKey)&language=en-US"
        api.get() { result in
            onComplete(result)
        }
    }
}
