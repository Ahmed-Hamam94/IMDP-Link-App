//
//  TopMovies.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 06/01/2023.
//

import Foundation
struct TopMovies: Decodable {

    let items: [Movie]?
    let errorMessage: String?

}

struct Movie: Decodable {

    let id: String?
    let rank: String?
    let title: String?
    let fullTitle: String?
    let year: String?
    let image: String?
    let crew: String?
    let imDbRating: String?
    let imDbRatingCount: String?

}
