//
//  TopCollectionViewCell.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 05/01/2023.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var topCategoryImage: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!{
        didSet{
//            nameLbl.textColor = .white
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpCell(name: String,photo: UIImage){
        nameLbl.text = name
        topCategoryImage.image = photo
    }
}
