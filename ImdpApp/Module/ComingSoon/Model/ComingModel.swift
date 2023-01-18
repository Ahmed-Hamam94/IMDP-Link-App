//
//  ComingModel.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 02/01/2023.
//

import Foundation

struct MyResult : Decodable {
    
    let items: [Item]?
    let errorMessage: String?
    
}

struct Item : Decodable {
    
    let id: String?
    let title: String?
    let fullTitle: String?
    let year: String?
    let releaseState: String?
    let image: String?
    let genres: String?
    let genreList: [GenreList]?
    
    let stars: String?
    
    
}
struct GenreList: Decodable {
    
    let key: String?
    let value: String?
    
}


