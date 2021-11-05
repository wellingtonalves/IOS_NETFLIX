//
//  Request.swift
//  Netflix
//
//  Created by Wellington Alves on 24/07/21.
//

protocol RequestProtocol {
    func all() -> [String:String]
    func get(key: String) -> Any?
}


class Request: RequestProtocol {
    
    var data: [String:String]
    
    init(_ data: [String:String]){
        self.data = data
    }
    
    func all() -> [String:String] {
        return self.data
    }
    
    func get(key: String) -> Any? {
        if let response = self.data[key] {
            return response
        }
        
        print("Chave nao existe")
        return nil
    }
}
