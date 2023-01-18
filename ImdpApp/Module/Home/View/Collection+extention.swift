//
//  Collection+extention.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 31/12/2022.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerCelNib<cell: UICollectionView>(cellClass: cell.Type){
        self.register(UINib(nibName: String(describing: cell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: cell.self))
    }
}
