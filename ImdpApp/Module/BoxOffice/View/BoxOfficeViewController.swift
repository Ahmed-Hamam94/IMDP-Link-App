//
//  BoxOfficeViewController.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 01/01/2023.
//

import UIKit

class BoxOfficeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var boxViewModel : BoxViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        setUPTable()
        setUpNibCell()
        
        boxViewModel = BoxViewModel(service: BoxOfficeNetwork())
        boxViewModel?.bindingBoxResult = {[weak self] in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
            
            
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        boxViewModel?.getBoxData()
    }
    
    func setUPTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        title = "Box Office"
    }
    func setUpNibCell(){
        tableView.register(UINib(nibName: "BoxOfficeTableViewCell", bundle: nil), forCellReuseIdentifier: "BoxOfficeTableViewCell")
        
    }
    
    
}
extension BoxOfficeViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxViewModel?.boxdata?.items?.count ?? 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BoxOfficeTableViewCell", for: indexPath) as? BoxOfficeTableViewCell else {return BoxOfficeTableViewCell()}
        let data = boxViewModel?.boxdata?.items?[indexPath.row]
        let imgUrl = URL(string: data?.image ?? "no img")
        cell.BoxOfficeImg.sd_setImage(with: imgUrl, placeholderImage: UIImage(named: "BoxOffice"))
        cell.setUpBoxCell(title: data?.title ?? "no title", rank: data?.rank ?? "no rank", gross: data?.gross ?? "no $")
        cell.backgroundColor = #colorLiteral(red: 0.5477023125, green: 0.5328298211, blue: 0.4767008424, alpha: 1)
        cell.layer.borderColor = UIColor.brown.cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    
    
}


