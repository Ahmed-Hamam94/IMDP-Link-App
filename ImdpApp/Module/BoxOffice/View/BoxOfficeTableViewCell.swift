//
//  BoxOfficeTableViewCell.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 14/01/2023.
//

import UIKit

class BoxOfficeTableViewCell: UITableViewCell {
    @IBOutlet weak var BoxOfficeImg: UIImageView!{
        didSet{
            BoxOfficeImg.layer.cornerRadius = BoxOfficeImg.frame.size.width / 8
            BoxOfficeImg.layer.borderColor = UIColor.darkGray.cgColor
            BoxOfficeImg.layer.borderWidth = 3
        }
    }
    
    @IBOutlet weak var titleLbl: UILabel!{
        didSet{
            titleLbl.layer.cornerRadius = titleLbl.frame.size.width / 12
            
            titleLbl.layer.borderColor = UIColor.darkGray.cgColor
            titleLbl.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var rankLbl: UILabel!{
        didSet{
            rankLbl.layer.cornerRadius = rankLbl.frame.size.width / 2
            rankLbl.layer.borderColor = UIColor.darkGray.cgColor
            rankLbl.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var grossLbl: UILabel!{
        didSet{
            grossLbl.layer.cornerRadius = grossLbl.frame.size.width / 4
            
            grossLbl.layer.borderColor = UIColor.darkGray.cgColor
            grossLbl.layer.borderWidth = 2
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
    func setUpBoxCell(title: String, rank:String, gross:String){
        titleLbl.text = " \(title)"
        rankLbl.text = "\(rank)"
        grossLbl.text = "\(gross)"
    }
}
