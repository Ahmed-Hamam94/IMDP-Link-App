//
//  BoxModel.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 03/01/2023.
//

import Foundation

struct BoxResult: Decodable {

    let items: [BoxItem]?
    let errorMessage: String?

    
}


struct BoxItem: Decodable {

    let id: String?
    let rank: String?
    let title: String?
    let image: String?
    let weekend: String?
    let gross: String?
    let weeks: String?

}
