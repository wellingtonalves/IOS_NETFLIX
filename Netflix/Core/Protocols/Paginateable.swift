//
//  ResponsePaginated.swift
//  Netflix
//
//  Created by Wellington Alves on 28/07/21.
//

protocol Paginateable: Decodable {
    var page: Int { get }
    var total_results : Int { get }
    var total_pages : Int { get }
}
