//
//  ComingSoonViewController.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 01/01/2023.
//

import UIKit
import SDWebImage
class ComingSoonViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var cominViewModel : ComingViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        setUpTable()
        setUpNibCell()
        cominViewModel = ComingViewModel(service: NetworkManager())
        cominViewModel?.bindingComingResult = {[weak self] in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cominViewModel?.getComingData()

    }
    
    func setUpTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        title = "Coming Soon"
    }
    func setUpNibCell(){
        tableView.register(UINib(nibName: "ComingTableViewCell", bundle: nil), forCellReuseIdentifier: "ComingTableViewCell")
    }


    
}
extension ComingSoonViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cominViewModel?.comingData?.items?.count ?? 1
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ComingTableViewCell", for: indexPath) as? ComingTableViewCell else {return ComingTableViewCell()}
        let data = cominViewModel?.comingData?.items?[indexPath.row]
        let imgUrl = URL(string: data?.image ?? "no img")
        cell.comingImage.sd_setImage(with: imgUrl,placeholderImage: UIImage(named: "ComingSoon 1"))
        cell.setUpCell(title: data?.title ?? "no title", release: data?.releaseState ?? "no release", genre: data?.genres ?? "no genre")
        cell.layer.borderColor = UIColor.brown.cgColor
        cell.layer.borderWidth = 1

        cell.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        return cell
    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//          if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0{
//              //scrolling down
//              changeTabBar(hidden: true, animated: true)
//          }
//          else{
//              //scrolling up
//              changeTabBar(hidden: false, animated: true)
//          }
//      }
//
//      func changeTabBar(hidden:Bool, animated: Bool){
//          let tabBar = self.tabBarController?.tabBar
//          let offset = (hidden ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.height - (tabBar?.frame.size.height)! )
//          if offset == tabBar?.frame.origin.y {return}
//          print("changing origin y position")
//          let duration:TimeInterval = (animated ? 0.5 : 0.0)
//          UIView.animate(withDuration: duration,
//                         animations: {tabBar!.frame.origin.y = offset},
//                         completion:nil)
//      }
  
}
