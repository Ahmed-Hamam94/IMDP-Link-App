//
//  MoviesTableViewCell.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 06/01/2023.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImage: UIImageView!{
        didSet{
            movieImage.layer.cornerRadius = movieImage.frame.size.width / 6
            movieImage.layer.borderColor = UIColor.darkGray.cgColor
            movieImage.layer.borderWidth = 3
        }
    }
    
    @IBOutlet weak var movieTitlLbl: UILabel!{
        didSet{
            movieTitlLbl.layer.cornerRadius = movieTitlLbl.frame.size.width / 8
            movieTitlLbl.layer.borderColor = UIColor.darkGray.cgColor
            movieTitlLbl.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var addToFavoriteBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
