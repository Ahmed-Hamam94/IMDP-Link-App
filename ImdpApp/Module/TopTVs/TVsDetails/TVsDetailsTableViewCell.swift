//
//  TVsDetailsTableViewCell.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 14/01/2023.
//

import UIKit

class TVsDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var tvsImage: UIImageView!{
        didSet{
            tvsImage.layer.cornerRadius = tvsImage.frame.size.width / 6
            tvsImage.layer.borderColor = UIColor.darkGray.cgColor
            tvsImage.layer.borderWidth = 3
        }
    }
    
    @IBOutlet weak var tvsTitleLbl: UILabel!{
        didSet{
            tvsTitleLbl.layer.cornerRadius = tvsTitleLbl.frame.size.width / 10
            tvsTitleLbl.layer.borderColor = UIColor.darkGray.cgColor
            tvsTitleLbl.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var tvsRankLbl: UILabel!{
        didSet{
            tvsRankLbl.layer.cornerRadius = tvsRankLbl.frame.size.width / 10
            tvsRankLbl.layer.borderColor = UIColor.darkGray.cgColor
            tvsRankLbl.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var tvsRatingLbl: UILabel!{
        didSet{
            tvsRatingLbl.layer.cornerRadius = tvsRatingLbl.frame.size.width / 8
            tvsRatingLbl.layer.borderColor = UIColor.darkGray.cgColor
            tvsRatingLbl.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var tvsCrewLbl: UILabel!{
        didSet{
            tvsCrewLbl.layer.cornerRadius = tvsCrewLbl.frame.size.width / 10
            tvsCrewLbl.layer.borderColor = UIColor.darkGray.cgColor
            tvsCrewLbl.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var tvsRatingCountLbl: UILabel!{
        didSet{
            tvsRatingCountLbl.layer.cornerRadius = tvsRatingCountLbl.frame.size.width / 8
            tvsRatingCountLbl.layer.borderColor = UIColor.darkGray.cgColor
            tvsRatingCountLbl.layer.borderWidth = 2
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell(title: String, rank: String, crew: String, rating: String, ratingCount: String){
        tvsTitleLbl.text = title
        tvsRankLbl.text = "Rank: \(rank)"
        tvsCrewLbl.text = "Crew: \(crew)"
        tvsRatingLbl.text = "Rating: \(rating)"
        tvsRatingCountLbl.text = "Rating Count: \(ratingCount)"
    }
    
}
