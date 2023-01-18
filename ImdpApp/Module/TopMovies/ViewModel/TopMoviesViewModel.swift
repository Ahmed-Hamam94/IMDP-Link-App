//
//  TopMoviesViewModel.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 06/01/2023.
//

import Foundation

class TopMoviesViewModel{
    var moviesData : TopMovies?
    var searchingMovies = [Movie]() //
    let service : NetworkManager
    var bindingMoviesResult : (()->()) = {}
    
    init(service: NetworkManager) {
        self.service = service
    }
    
    func getMovies(){
        NetworkManager.fetchTopMovies { [weak self] moviesResponse in
            guard let self = self else {return}
            self.moviesData = moviesResponse
            self.bindingMoviesResult()
        }
    }
    
}
