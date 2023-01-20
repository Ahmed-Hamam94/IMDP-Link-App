//
//  FavoriteCollectionViewCell.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 15/01/2023.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var favoriteImageView: UIImageView!{
        didSet{
            favoriteImageView.layer.cornerRadius = favoriteImageView.frame.size.width / 6
            favoriteImageView.layer.borderColor = UIColor.darkGray.cgColor
            favoriteImageView.layer.borderWidth = 3
        }
    }
    
    @IBOutlet weak var favoriteTitleLbl: UILabel!{
        didSet{
            favoriteTitleLbl.layer.cornerRadius = favoriteTitleLbl.frame.size.height / 2
            favoriteTitleLbl.layer.borderColor = UIColor.darkGray.cgColor
            favoriteTitleLbl.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var deleteButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
