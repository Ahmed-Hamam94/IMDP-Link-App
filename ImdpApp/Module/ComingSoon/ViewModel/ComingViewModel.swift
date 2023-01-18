//
//  ComingViewModel.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 02/01/2023.
//

import Foundation

class ComingViewModel{
    let service : NetworkManager
    var bindingComingResult : (()->()) = {}
    var comingData : MyResult?
    
    init(service: NetworkManager) {
        self.service = service
    }
    func getComingData(){
        NetworkManager.fetchComing { [weak self] comingResponse in
            guard let self = self else {return}
            self.comingData = comingResponse
            self.bindingComingResult()
        }
    }
}
