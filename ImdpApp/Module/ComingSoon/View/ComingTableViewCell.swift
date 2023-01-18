//
//  ComingTableViewCell.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 02/01/2023.
//

import UIKit

class ComingTableViewCell: UITableViewCell {

    @IBOutlet weak var comingImage: UIImageView!{
        didSet{
        
            comingImage.layer.cornerRadius = comingImage.frame.size.width / 6
            comingImage.layer.borderColor = UIColor.darkGray.cgColor
            comingImage.layer.borderWidth = 3
        }
    }
    
    @IBOutlet weak var releaseLbl: UILabel!{
        didSet{
            releaseLbl.layer.cornerRadius = releaseLbl.frame.size.width / 4
            releaseLbl.layer.borderColor = UIColor.darkGray.cgColor
            releaseLbl.layer.borderWidth = 2
            
        }
    }
    @IBOutlet weak var titleLbl: UILabel!{
        didSet{
            titleLbl.layer.cornerRadius = titleLbl.frame.size.width / 4
            titleLbl.layer.borderColor = UIColor.darkGray.cgColor
            titleLbl.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var genreLbl: UILabel!{
        didSet{
            genreLbl.layer.cornerRadius = genreLbl.frame.size.width / 4
            genreLbl.layer.borderColor = UIColor.darkGray.cgColor
            genreLbl.layer.borderWidth = 2
        }
    }
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }
  

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setUpCell(title: String, release: String, genre: String){
        titleLbl.text = title
        releaseLbl.text = release
        genreLbl.text = genre
    }

}

