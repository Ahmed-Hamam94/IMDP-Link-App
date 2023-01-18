//
//  TopTVs.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 06/01/2023.
//

import Foundation

struct TopTVs: Decodable {

    let items: [TVs]?
    let errorMessage: String?

}

struct TVs: Decodable {

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
