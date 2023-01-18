//
//  HomeCollectionViewCell.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 31/12/2022.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryImage: UIImageView!
    
    @IBOutlet weak var categoryLblName: UILabel!{
        didSet{
            categoryLblName.layer.cornerRadius = categoryLblName.frame.size.width / 10
            categoryLblName.layer.borderColor = UIColor.darkGray.cgColor
            categoryLblName.layer.borderWidth = 3
            categoryLblName.textColor = .black
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpCell (photo:UIImage , name:String){
        categoryImage.image = photo
        categoryLblName.text = name
    }
    override func layoutSubviews() {
        categoryImage.layer.cornerRadius = categoryImage.bounds.width/2
        categoryImage.clipsToBounds = true
    }
}
