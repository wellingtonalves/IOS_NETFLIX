//
//  MovieListResponse.swift
//  Netflix
//
//  Created by Wellington Alves on 28/07/21.
//

struct MovieListResponse: Paginateable {
    var total_results: Int
    
    var total_pages: Int
    
    var page: Int
    
    let results: [Movie]
}
