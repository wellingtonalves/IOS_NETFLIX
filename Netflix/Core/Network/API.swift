//
//  API.swift
//  Netflix
//
//  Created by Wellington Alves on 23/07/21.
//

import Alamofire

typealias NetworkResult<T: Decodable> = (Result<T, Error>) -> Void
//typealias NetworkResult<T: Decodable> = ((Result<T, Error>) -> Void)

protocol APIProtocol {
    func get<T:Decodable>(_ params: String?, onComplete: @escaping NetworkResult<T>) -> Void
    //    func post(_ params: String?) -> Any
    //    func put(_ params: String?) -> Any
    //    func delete(_ params: String?) -> Any
}

class API: APIProtocol {
    
    var endpoint: String = ""
    var baseURL: String = ""

    init(baseURL: String){
        self.baseURL = baseURL
    }
    
    func get<T:Decodable>(_ params:String? = "", onComplete: @escaping NetworkResult<T>) -> Void {
        let request = AF.request(self.baseURL + self.endpoint, encoding:JSONEncoding.default)
        request.validate().responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let data = response.data ?? Data()
                    let result = try JSONDecoder().decode(T.self, from: data)
                    onComplete(.success(result))
                } catch {
                    onComplete(.failure(error))
                }
            case .failure:
                break
            //                onComplete(.failure(Error))
            }
        }
    }
}
