//
//  FavoriteTVTableViewCell.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 08/01/2023.
//

import UIKit

class FavoriteTVTableViewCell: UITableViewCell {

    @IBOutlet weak var tvTitleLbl: UILabel!{
        didSet{
            tvTitleLbl.layer.cornerRadius = tvTitleLbl.frame.size.width / 8
            tvTitleLbl.layer.borderColor = UIColor.darkGray.cgColor
            tvTitleLbl.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var tvImageView: UIImageView!{
        didSet{
            tvImageView.layer.cornerRadius = tvImageView.frame.size.width / 6
            tvImageView.layer.borderColor = UIColor.darkGray.cgColor
            tvImageView.layer.borderWidth = 3
        }
    }
    
    @IBOutlet weak var deleteTVButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
