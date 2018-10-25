//
//  ViewController.swift
//  Sync money
//
//  Created by Dan  Tatar on 22/10/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import UIKit

class CustomTabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        createControllers()
        
        navigationController?.navigationBar.isTranslucent = false
        
        self.tabBar.isTranslucent = false
    }
    
    func createControllers() {
        
        let accountsVC = AccountsViewController()
        let accountsViewController = UINavigationController(rootViewController: accountsVC)
        accountsViewController.title = "Accounts"
        accountsViewController.tabBarItem.image = UIImage(named: "accounts")
        
        let cardVC = CardViewController()
        let cardViewController = UINavigationController(rootViewController: cardVC)
        cardViewController.title = "Cards"
        cardViewController.tabBarItem.image = UIImage(named: "cards")
        
        let scanVC = ScanORViewController()
        let scanORViewController = UINavigationController(rootViewController: scanVC)
        scanORViewController.title = "Accounts"
        scanORViewController.tabBarItem.image = UIImage(named: "orcode")
        
        let marketVC = MarketViewController()
        let marketViewController = UINavigationController(rootViewController: marketVC)
        marketViewController.title = "Market"
        marketViewController.tabBarItem.image = UIImage(named: "market")
        
        let moreVC = MoreViewController()
        let moreViewController = UINavigationController(rootViewController: accountsVC)
        moreViewController.title = "More"
        moreViewController.tabBarItem.image = UIImage(named: "more")
        
        viewControllers = [accountsViewController, cardViewController, scanORViewController, marketViewController, moreViewController]
    }
    
}

