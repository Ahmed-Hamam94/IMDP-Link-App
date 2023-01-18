//
//  FavoriteViewController.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 31/12/2022.
//

import UIKit
import SDWebImage
import CoreData
class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var titleFavotiteMoviesLbl: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var titleFavoriteTVLbl: UILabel!
    @IBOutlet weak var secondTableView: UITableView!
    
    let appdelegat = UIApplication.shared.delegate as! AppDelegate
    var viewContext : NSManagedObjectContext?
    var favoriteViewModel : FavoriteViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContext = appdelegat.persistentContainer.viewContext
        setUpTable()
        setUpCell()
        favoriteViewModel = FavoriteViewModel()
        favoriteViewModel?.favBindingResult = {[weak self] in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.secondTableView.reloadData()
                
            }
        }
        favoriteViewModel?.getSavedData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        collectionView.reloadData()
        secondTableView.reloadData()
    }
    
    func setUpTable(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        secondTableView.delegate = self
        secondTableView.dataSource = self
        secondTableView.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
    }
    
    func setUpCell(){
        collectionView.register(UINib(nibName: "FavoriteCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FavoriteCollectionViewCell")
        secondTableView.register(UINib(nibName: "FavoriteTVTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoriteTVTableViewCell")
    }
    
}
extension FavoriteViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return TVsViewController.arrCoreTVs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let favTVcell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTVTableViewCell", for: indexPath) as? FavoriteTVTableViewCell else{return FavoriteTVTableViewCell()}
        favTVcell.tvTitleLbl?.text = TVsViewController.arrCoreTVs[indexPath.row].title
        let tvData = TVsViewController.arrCoreTVs[indexPath.row]
        let tvImgUrl = URL(string: tvData.image ?? "no img")
        favTVcell.tvImageView.sd_setImage(with: tvImgUrl,placeholderImage: UIImage(named: "imdpp"))
        favTVcell.deleteTVButton.tag = indexPath.row
        favTVcell.deleteTVButton.addTarget(self, action: #selector(deleteTV(sender:)), for: .touchUpInside)
        favTVcell.layer.borderColor = UIColor.brown.cgColor
        favTVcell.layer.borderWidth = 1
        favTVcell.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        return favTVcell
    }
    
    
    
    func deleteItem<T: NSManagedObject>(item: T){
        viewContext?.delete(item)
        do{
            try viewContext?.save()
        }catch{
            print(error)
        }
        
    }
    
    
    @objc
    func deleteTV(sender:UIButton){
        deleteItem(item: TVsViewController.arrCoreTVs[sender.tag])
        TVsViewController.arrCoreTVs.remove(at: sender.tag)
        secondTableView.reloadData()
        
    }
    
}

extension FavoriteViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TopMoviesViewController.arrCoreMovies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let favcell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCollectionViewCell", for: indexPath) as? FavoriteCollectionViewCell else{return FavoriteCollectionViewCell()}
        favcell.favoriteTitleLbl?.text = TopMoviesViewController.arrCoreMovies[indexPath.row].title
        let data = TopMoviesViewController.arrCoreMovies[indexPath.row]
        let imgUrl = URL(string: data.image ?? "no img")
        
        favcell.favoriteImageView.sd_setImage(with: imgUrl,placeholderImage: UIImage(named: "imdpp"))
        let titleee = TopMoviesViewController.arrCoreMovies[indexPath.row].title
        print(titleee ?? "print title")
        favcell.deleteButton.tag = indexPath.row
        favcell.deleteButton.addTarget(self, action: #selector(deleteMovie(sender:)), for: .touchUpInside)
        favcell.layer.borderColor = UIColor.brown.cgColor
        favcell.layer.borderWidth = 1
        favcell.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        return favcell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:collectionView.frame.width, height: collectionView.frame.height)
        
    }
    
    @objc
    func deleteMovie(sender:UIButton){
        deleteItem(item: TopMoviesViewController.arrCoreMovies[sender.tag])
        TopMoviesViewController.arrCoreMovies.remove(at: sender.tag)
        collectionView.reloadData()
    }
}
