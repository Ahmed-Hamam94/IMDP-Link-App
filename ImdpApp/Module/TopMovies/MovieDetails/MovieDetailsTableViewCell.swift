//
//  MovieDetailsTableViewCell.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 06/01/2023.
//

import UIKit

class MovieDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImageView: UIImageView!{
        didSet{
            movieImageView.layer.cornerRadius = movieImageView.frame.size.width / 6
            movieImageView.layer.borderColor = UIColor.darkGray.cgColor
            movieImageView.layer.borderWidth = 3
        }
    }
    
    @IBOutlet weak var titlrLbl: UILabel!{
        didSet{
            titlrLbl.layer.cornerRadius = titlrLbl.frame.size.width / 10
            titlrLbl.layer.borderColor = UIColor.darkGray.cgColor
            titlrLbl.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var rankLbl: UILabel!{
        didSet{
            rankLbl.layer.cornerRadius = rankLbl.frame.size.width / 10
            rankLbl.layer.borderColor = UIColor.darkGray.cgColor
            rankLbl.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var crewLbl: UILabel!{
        didSet{
            crewLbl.layer.cornerRadius = crewLbl.frame.size.width / 10
            crewLbl.layer.borderColor = UIColor.darkGray.cgColor
            crewLbl.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var ratingLbl: UILabel!{
        didSet{
            ratingLbl.layer.cornerRadius = ratingLbl.frame.size.width / 8
            ratingLbl.layer.borderColor = UIColor.darkGray.cgColor
            ratingLbl.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var ratingCountLbl: UILabel!{
        didSet{
            ratingCountLbl.layer.cornerRadius = ratingCountLbl.frame.size.width / 8
            ratingCountLbl.layer.borderColor = UIColor.darkGray.cgColor
            ratingCountLbl.layer.borderWidth = 2
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func setUpCell(title: String, rank: String, crew: String, rating: String, ratingCount: String){
        titlrLbl.text = title
        rankLbl.text = "Rank: \(rank)"
        crewLbl.text = "Crew: \(crew)"
        ratingLbl.text = "Rating: \(rating)"
        ratingCountLbl.text = "Rating Count: \(ratingCount)"
    }
}
