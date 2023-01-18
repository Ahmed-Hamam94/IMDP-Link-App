//
//  NetworkManager.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 02/01/2023.
//

import Foundation
import Alamofire
// another apiKey -> k_lmpd4ndq


class NetworkManager{
  
    static func fetchComing(completionHandler: @escaping(MyResult?)->Void){
        let url = "https://imdb-api.com/en/API/ComingSoon/k_6k6j0s0r"
        AF.request(url,method: .get, encoding: URLEncoding.queryString).responseDecodable(of: MyResult.self) { response in
            print(response)
            guard let comingResponse = response.value else {return}
            print(comingResponse)
            completionHandler(comingResponse)
        }
    }
    static func fetchTopMovies(completionHandler: @escaping(TopMovies?)->Void){
        let url = "https://imdb-api.com/en/API/Top250Movies/k_6k6j0s0r"

        AF.request(url,method: .get, encoding: URLEncoding.queryString).responseDecodable(of: TopMovies.self) { response in
            print(response)
            guard let moviesResponse = response.value else {return}
            print(moviesResponse)
            completionHandler(moviesResponse)
        }
    }
        
    static func fetchTopTVS(completionHandler: @escaping(TopTVs?)->Void){
        let url = "https://imdb-api.com/en/API/Top250TVs/k_6k6j0s0r"
        AF.request(url, method: .get, encoding: URLEncoding.queryString).responseDecodable(of: TopTVs.self) { response in
            print(response)
            guard let tvsResponse = response.value else{return}
                print(tvsResponse)
                completionHandler(tvsResponse)
            }
        }
    }
        
        


