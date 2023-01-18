//
//  TopMoviesViewController.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 06/01/2023.
//

import UIKit
import SDWebImage
import CoreData

class TopMoviesViewController: UIViewController {
    @IBOutlet weak var moviesTableView: UITableView!
    
    @IBOutlet weak var moviesSearhBar: UISearchBar!
    
    var topMoviesViewModel : TopMoviesViewModel?
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var viewContext : NSManagedObjectContext?
    static var arrCoreMovies = [MovieEntity]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPTable()
        setUpCell()
        moviesSearhBar.delegate = self
        viewContext = appdelegate.persistentContainer.viewContext
        topMoviesViewModel = TopMoviesViewModel(service: NetworkManager())
        topMoviesViewModel?.bindingMoviesResult = {[weak self] in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.moviesTableView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        topMoviesViewModel?.getMovies()
    }
    func setUpCell(){
        moviesTableView.register(UINib(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "MoviesTableViewCell")
    }
    
    
    func setUPTable(){
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        title = "Top Movies"
    }
    
}
extension TopMoviesViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return topMoviesViewModel?.searchingMovies.count ?? 2
        }else{
            return topMoviesViewModel?.moviesData?.items?.count ?? 1
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = moviesTableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath) as? MoviesTableViewCell else{return MoviesTableViewCell()}
        let data = topMoviesViewModel?.moviesData?.items?[indexPath.row]
        if searching{
            
            cell.movieTitlLbl.text = topMoviesViewModel?.searchingMovies[indexPath.row].title
            
            
            let imgUrl = URL(string: topMoviesViewModel?.searchingMovies[indexPath.row].image ?? "no img")
            cell.movieImage.sd_setImage(with: imgUrl,placeholderImage: UIImage(named: "imdpp"))
            
        }else{
            cell.movieTitlLbl.text = data?.title
            let imgUrl = URL(string: data?.image ?? "no img")
            cell.movieImage.sd_setImage(with: imgUrl,placeholderImage: UIImage(named: "imdpp"))
            
        }
        cell.addToFavoriteBtn.tag = indexPath.row
        cell.addToFavoriteBtn.addTarget(self, action: #selector(addToFav(sender:)), for: .touchUpInside)
        cell.layer.borderColor = UIColor.brown.cgColor
        cell.layer.borderWidth = 1
        cell.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let VCDetails = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController{
            VCDetails.moviewObj = topMoviesViewModel?.moviesData?.items?[indexPath.row]
            navigationController?.pushViewController(VCDetails, animated: true)
        }
    }
    @objc
    func addToFav(sender: UIButton){
        
        guard let viewContext = viewContext, let arrMovie = topMoviesViewModel?.moviesData?.items , let arrsearchMovie = topMoviesViewModel?.searchingMovies else{return}
        
        if searching{
            
            if  FavoriteViewModel.shared.findMovieInCoreData(movie: arrsearchMovie[sender.tag]){
                let alert = UIAlertController(title: "Warning", message: "This Movie is already added", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default,handler: nil
                                              
                                             ))
                present(alert, animated: true)
                print("movie in favorite") }else{
                    
                    FavoriteViewModel.shared.saveToCoreData(movies: arrsearchMovie[sender.tag] , viewContext: viewContext)
                }
        }else{
            if  !FavoriteViewModel.shared.findMovieInCoreData(movie: arrMovie[sender.tag]){
                
                
                FavoriteViewModel.shared.saveToCoreData(movies: arrMovie[sender.tag], viewContext: viewContext)
                
            }else{
                let alert = UIAlertController(title: "Warning", message: "This Movie is already added", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default,handler: nil
                                              
                                             ))
                present(alert, animated: true)
            }
            
            
        }
        sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        print("sender= \(sender.tag)")
    }
    
    
}
extension TopMoviesViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        topMoviesViewModel?.searchingMovies = topMoviesViewModel?.moviesData?.items?.filter({$0.title?.lowercased().prefix(searchText.count) ?? "" == searchText.lowercased()}) ?? []
        
        
        searching = true
        moviesTableView.reloadData()
    }
    
}


