//
//  BoxOfficeNetwork.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 03/01/2023.
//

import Foundation

class BoxOfficeNetwork{

    static func fetchBox(completionHandler: @escaping(BoxResult?)->Void){
        guard let url = URL(string:  "https://imdb-api.com/en/API/BoxOffice/k_6k6j0s0r") else {return}
                let request = URLRequest(url: url)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            guard let data = data else{ // Hndle Empty Data
                print("Empty Data")
                return}
            do {
                let boxResponse = try JSONDecoder().decode(BoxResult.self, from: data)
                completionHandler(boxResponse)
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

