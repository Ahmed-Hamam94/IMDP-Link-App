//
//  TVsViewModel.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 06/01/2023.
//

import Foundation

class TVsViewModel{
    
    var tvsData : TopTVs?
    var searchingTVs = [TVs]()
    var tvShow : TVs?
    var service : NetworkManager?
    var bindingTVsResult : (()->()) = {}
    
    init(service: NetworkManager){
        self.service = service
    }
    
    func getTVs(){
        NetworkManager.fetchTopTVS { [weak self] tvsResponse in
            guard let self = self else{return}
            self.tvsData = tvsResponse
            self.bindingTVsResult()
        }
    }
}
