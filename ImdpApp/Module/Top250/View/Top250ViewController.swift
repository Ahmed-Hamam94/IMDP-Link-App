//
//  Top250ViewController.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 05/01/2023.
//

import UIKit

class Top250ViewController: UIViewController {
    @IBOutlet weak var arrayImages: UIImageView!{
        didSet{
            arrayImages.layer.cornerRadius = arrayImages.frame.size.height / 5
            arrayImages.layer.borderColor = UIColor.darkGray.cgColor
            arrayImages.layer.borderWidth = 3
            
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrayTop = [TopCategory]()
    override func viewDidLoad() {
        super.viewDidLoad()
        makeImageChange()
        setUpCollection()
        setUpNibCell()
        arrayTop = addToArray()
        
    }
    
    
    func makeImageChange(){
        let images = [UIImage(named: "imdpp"),UIImage(named: "shawshank"),UIImage(named: "the godfather"),UIImage(named: "dark knight"),UIImage(named: "imdptv"),UIImage(named: "breakingbad"),UIImage(named: "bandof"),UIImage(named: "chern")].compactMap{$0}
        arrayImages.animationImages = images
        arrayImages.animationDuration = 8.9
        arrayImages.startAnimating()
    }
    func setUpCollection(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        title = "Top 250"
    }
    func setUpNibCell(){
        collectionView.register(UINib(nibName: "TopCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopCollectionViewCell")
    }
    func addToArray()->[TopCategory]{
        var arrayTo = [TopCategory]()
        arrayTo.append(TopCategory(name: "Top Movies",image: UIImage(named: "imdp1")))
        arrayTo.append(TopCategory(name: "Top TV Shows", image: UIImage(named: "imdp1")))
        return arrayTo
    }
    
}
extension Top250ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayTop.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: (collectionView.frame.height/2)-1)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCollectionViewCell", for: indexPath) as? TopCollectionViewCell else{return TopCollectionViewCell()}
        let data = arrayTop[indexPath.row]
        cell.setUpCell(name: data.name!, photo: data.image!)
        cell.layer.cornerRadius = cell.frame.size.width / 4
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 3
        cell.backgroundColor = .black
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let VCMovies = storyboard?.instantiateViewController(withIdentifier: "VCMovies") as? TopMoviesViewController else{return}
        guard let VCTVs = storyboard?.instantiateViewController(withIdentifier: "VCTVs") as? TVsViewController else{return}
        if indexPath.row == 0{
            self.navigationController?.pushViewController(VCMovies, animated: true)
        }else{
            self.navigationController?.pushViewController(VCTVs, animated: true)
        }
    }
    
}
