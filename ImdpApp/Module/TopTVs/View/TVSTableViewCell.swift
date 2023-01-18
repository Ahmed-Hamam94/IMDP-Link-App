//
//  TVSTableViewCell.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 06/01/2023.
//

import UIKit

class TVSTableViewCell: UITableViewCell {
    @IBOutlet weak var tvsImage: UIImageView!{
        didSet{
            tvsImage.layer.cornerRadius = tvsImage.frame.size.width / 6
            tvsImage.layer.borderColor = UIColor.darkGray.cgColor
            tvsImage.layer.borderWidth = 3
        }
    }
    
    @IBOutlet weak var tvsTitleLbl: UILabel!{
        didSet{
            tvsTitleLbl.layer.cornerRadius = tvsTitleLbl.frame.size.width / 8
            tvsTitleLbl.layer.borderColor = UIColor.darkGray.cgColor
            tvsTitleLbl.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var addToFavoriteBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
