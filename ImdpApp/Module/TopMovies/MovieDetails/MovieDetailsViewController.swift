//
//  MovieDetailsViewController.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 06/01/2023.
//

import UIKit
import SDWebImage
class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var topMoviesViewModel : TopMoviesViewModel?
    var moviewObj : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        setUpTable()
        setUpCell()
        topMoviesViewModel = TopMoviesViewModel(service: NetworkManager())
        
    }
    
    
    func setUpTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
    }
    
    func setUpCell(){
        tableView.register(UINib(nibName: "MovieDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieDetailsTableViewCell")
    }
    
}
extension MovieDetailsViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailsTableViewCell") as? MovieDetailsTableViewCell else{return MovieDetailsTableViewCell()}
        let urlImage = URL(string: moviewObj?.image ?? "no img")
        
        cell.movieImageView.sd_setImage(with: urlImage,placeholderImage: UIImage(named: "Top 250"))
        
        cell.setUpCell(title: moviewObj?.fullTitle ?? "title?", rank: moviewObj?.rank ?? "rank?", crew: moviewObj?.crew ?? "crew?", rating: moviewObj?.imDbRating ?? "rating?", ratingCount: moviewObj?.imDbRatingCount ?? "count?")
        cell.layer.borderColor = UIColor.brown.cgColor
        cell.layer.borderWidth = 1
        cell.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        return cell
    }
    
    
}
