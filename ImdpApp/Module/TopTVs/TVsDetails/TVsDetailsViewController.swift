//
//  TVsDetailsViewController.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 07/01/2023.
//

import UIKit
import SDWebImage
class TVsDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tvsViewModel : TVsViewModel?
    var tvsObj : TVs?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        tvsViewModel = TVsViewModel(service: NetworkManager())
        tableView.register(UINib(nibName: "TVsDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "TVsDetailsTableViewCell")
    }
    
    func setUpTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
    }

}
extension TVsDetailsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TVsDetailsTableViewCell") as? TVsDetailsTableViewCell else{return TVsDetailsTableViewCell()}
        let urlImage = URL(string: tvsObj?.image ?? "no img")
        cell.tvsImage.sd_setImage(with: urlImage,placeholderImage: UIImage(named: "Top 250"))
       
        cell.setUpCell(title: tvsObj?.fullTitle ?? "title?", rank: tvsObj?.rank ?? "rank?", crew: tvsObj?.crew ?? "crew?", rating: tvsObj?.imDbRating ?? "rating?", ratingCount: tvsObj?.imDbRatingCount ?? "count?")
        cell.layer.borderColor = UIColor.brown.cgColor
        cell.layer.borderWidth = 1
        cell.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        return cell
    }
    
    
}

