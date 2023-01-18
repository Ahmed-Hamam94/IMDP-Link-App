//
//  BoxViewModel.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 03/01/2023.
//

import Foundation

class BoxViewModel{
    var boxdata : BoxResult?
    let service : BoxOfficeNetwork
    var bindingBoxResult : (()->()) = {}
    
    
    init(service: BoxOfficeNetwork) {
        self.service = service
    }
    
    
    func getBoxData(){
        
        BoxOfficeNetwork.fetchBox { [weak self] boxResponse in
            guard let self = self else {return}
            self.boxdata = boxResponse
            self.bindingBoxResult()
        }
        
    }
    
}

