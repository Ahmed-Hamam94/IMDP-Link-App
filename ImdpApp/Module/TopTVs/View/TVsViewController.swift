//
//  TVsViewController.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 06/01/2023.
//

import UIKit
import SDWebImage
import CoreData
class TVsViewController: UIViewController {
    @IBOutlet weak var tvsTableView: UITableView!
    
    @IBOutlet weak var tvSearchBar: UISearchBar!
    
    var tvsViewModel : TVsViewModel?
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var viewContext : NSManagedObjectContext?
    static var arrCoreTVs = [TVsEntity]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContext = appdelegate.persistentContainer.viewContext
        tvSearchBar.delegate = self
        setUpTable()
        setUpCell()
        tvsViewModel = TVsViewModel(service: NetworkManager())
        
        tvsViewModel?.bindingTVsResult = { [weak self] in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.tvsTableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvsViewModel?.getTVs()
    }
    
    func setUpTable(){
        tvsTableView.delegate = self
        tvsTableView.dataSource = self
        tvsTableView.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        title = "Top TV Shows"
    }
    func setUpCell(){
        tvsTableView.register(UINib(nibName: "TVSTableViewCell", bundle: nil), forCellReuseIdentifier: "TVSTableViewCell")
    }
    
}

extension TVsViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return tvsViewModel?.searchingTVs.count ?? 2
        }else{
            return tvsViewModel?.tvsData?.items?.count ?? 1
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tvsTableView.dequeueReusableCell(withIdentifier: "TVSTableViewCell", for: indexPath) as? TVSTableViewCell else{return TVSTableViewCell()}
        if searching{
            cell.tvsTitleLbl.text = tvsViewModel?.searchingTVs[indexPath.row].title
            
            let imgUrl = URL(string: tvsViewModel?.searchingTVs[indexPath.row].image ?? "no img")
            cell.tvsImage.sd_setImage(with: imgUrl,placeholderImage: UIImage(named: "imdpp"))
            
        }else{
            let data = tvsViewModel?.tvsData?.items?[indexPath.row]
            cell.tvsTitleLbl.text = data?.title
            let urlImage = URL(string: data?.image ?? "no img")
            cell.tvsImage.sd_setImage(with: urlImage ,placeholderImage: UIImage(named: "imdptv"))
            
        }
        cell.addToFavoriteBtn.tag = indexPath.row
        cell.addToFavoriteBtn.addTarget(self, action: #selector(addToFavorite(sender:)), for: .touchUpInside)
        cell.layer.borderColor = UIColor.brown.cgColor
        cell.layer.borderWidth = 1
        cell.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let VCDetailsTV = storyboard?.instantiateViewController(withIdentifier: "VCDetailsTV") as? TVsDetailsViewController{
            VCDetailsTV.tvsObj = tvsViewModel?.tvsData?.items?[indexPath.row]
            navigationController?.pushViewController(VCDetailsTV, animated: true)
        }
    }
    @objc
    func addToFavorite(sender: UIButton){
        guard let viewContext = viewContext, let arrTVs = tvsViewModel?.tvsData?.items, let arrSearchingTV = tvsViewModel?.searchingTVs else{return}
        if searching{
            if  FavoriteViewModel.shared.findTVsInCoreData(tvs: arrSearchingTV[sender.tag]){
                let alert = UIAlertController(title: "Warning", message: "This TV Show is already added", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default,handler: nil
                                              
                                             ))
                present(alert, animated: true)
                print("TV Show in favorite") }else{
                    
                    FavoriteViewModel.shared.saveTVsToCoreData(tv: arrSearchingTV[sender.tag],viewContext: viewContext)
                }
            
            
            
        }else{
            if  !FavoriteViewModel.shared.findTVsInCoreData(tvs: arrTVs[sender.tag]){
                
                
                FavoriteViewModel.shared.saveTVsToCoreData(tv: arrTVs[sender.tag], viewContext: viewContext)
                
            }else{
                let alert = UIAlertController(title: "Warning", message: "This TV Show is already added", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default,handler: nil
                                              
                                             ))
                present(alert, animated: true)
            }
            
            
        }
        sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        print("sender= \(sender.tag)")
    }
}
extension TVsViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        tvsViewModel?.searchingTVs = tvsViewModel?.tvsData?.items?.filter({$0.title?.prefix(searchText.count) ?? "" == searchText}) ?? []
        
        
        searching = true
        tvsTableView.reloadData()
    }
}
