//
//  CustomTabBarViewController.swift
//  MOE
//
//  Created by webwerks on 8/11/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit


class CustomTabBarViewController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        
    }

   
   
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        
        // This is a bit dangerous if we move where 'newController' is located in the tabs, this will break.
        let newController = viewControllers![2] as! MenuNavController
        
        // Check if the view about to load is the second tab and if it is, load the modal form instead.
        if  viewController == newController {
            
            
            let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let mainNavigationController = storyBoard.instantiateViewController(withIdentifier: "MenuNavController") as! MenuNavController
            
            mainNavigationController.setViewControllers([VC1], animated: false)
            
            mainNavigationController.providesPresentationContextTransitionStyle = true
            mainNavigationController.definesPresentationContext = true
            mainNavigationController.modalPresentationStyle=UIModalPresentationStyle.overCurrentContext
            
            present(mainNavigationController, animated: true, completion: nil)
            
            return false
        } else {
            return true
        }
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("the selected index is : \(String(describing: tabBar.items?.index(of: item)))")
       
        
        if tabBar.items?.index(of: item) == 2 {
            
          /*
            //present new controller
            let objVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController")
            
            objVC?.providesPresentationContextTransitionStyle = true
            objVC?.definesPresentationContext = true
            objVC?.modalPresentationStyle=UIModalPresentationStyle.overCurrentContext
            
            
            self.present(objVC!, animated: true, completion: nil)
 */
        }
    }
}
