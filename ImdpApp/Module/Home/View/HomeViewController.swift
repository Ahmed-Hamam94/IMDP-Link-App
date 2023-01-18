//
//  HomeViewController.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 31/12/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var homeViewModel : HomeViewModel?
    var arrayH = [Category]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollection()
        setUpNibCell()
        
        
        homeViewModel = HomeViewModel(categoryArray: arrayH)
        arrayH = addToArray()
        collectionView.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
        
    }
    
    func setUpCollection(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        
    }
    func setUpNibCell(){
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
    func addToArray()->[Category]{
        homeViewModel?.categoryArray.append(Category(image: UIImage(named: "ComingSoon 1"), name: "Coming Soon"))
        homeViewModel?.categoryArray.append(Category(image: UIImage(named: "BoxOffice"), name: "BoxOffice"))
        homeViewModel?.categoryArray.append(Category(image: UIImage(named: "Top 250"), name: "Top 250"))
        
        let arrOfCategory = homeViewModel?.categoryArray
        print(arrOfCategory ?? [])
        return arrOfCategory ?? []
        
    }
    
}
extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayH.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else{return UICollectionViewCell()}
        let data = arrayH[indexPath.row]
        cell.setUpCell(photo: (data.image)! , name: data.name ?? "no name")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.width/2)-1, height: 250)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CategoryCollectionReusableView", for: indexPath) as! CategoryCollectionReusableView
        header.headerLbl.text = "IMDP"
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let VCComingSoon = storyboard?.instantiateViewController(withIdentifier: "ComingSoon") as? ComingSoonViewController else{return}
        
        guard let VCBoxOffice = storyboard?.instantiateViewController(withIdentifier: "BoxOffice") as? BoxOfficeViewController else{return}
        guard let VCTop250 = storyboard?.instantiateViewController(withIdentifier: "Top250") as? Top250ViewController else{return}
        
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(VCComingSoon, animated: true)
        }else if indexPath.row == 1{
            self.navigationController?.pushViewController(VCBoxOffice, animated: true)
        }else {
            self.navigationController?.pushViewController(VCTop250, animated: true)
        }
        
    }
    
    
}

