//
//  TabBarController.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 15/01/2023.
//

import UIKit

class TabBarController: UITabBarController,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        changeRadiusOfTabbar()
        
    }
    
    func changeRadiusOfTabbar(){
      
          self.tabBar.layer.masksToBounds = true
          self.tabBar.isTranslucent = true
          self.tabBar.layer.cornerRadius = 30
          self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
      
         }

  
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
          if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0{
              //scrolling down
              changeTabBar(hidden: true, animated: true)
          }
          else{
              //scrolling up
              changeTabBar(hidden: false, animated: true)
          }
      }

      func changeTabBar(hidden:Bool, animated: Bool){
          let tabBar = self.tabBarController?.tabBar
          let offset = (hidden ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.height - (tabBar?.frame.size.height)! )
          if offset == tabBar?.frame.origin.y {return}
          print("changing origin y position")
          let duration:TimeInterval = (animated ? 0.5 : 0.0)
          UIView.animate(withDuration: duration,
                         animations: {tabBar!.frame.origin.y = offset},
                         completion:nil)
      }
    

  }


