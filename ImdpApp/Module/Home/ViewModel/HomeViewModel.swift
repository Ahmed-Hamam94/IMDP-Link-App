//
//  HomeViewModel.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 31/12/2022.
//

import Foundation
class HomeViewModel{
    var bindingHome : (()->()) = {}
    var categoryArray = [Category]()

    init(categoryArray: [Category] = [Category]()) {
        self.categoryArray = categoryArray
    }
    
}
