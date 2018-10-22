//
//  MarketViewController.swift
//  Sync money
//
//  Created by Dan  Tatar on 22/10/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import UIKit

class MarketViewController: UITableViewController {
    
    var items: [Categories] = [ Categories(name: "pick", image: #imageLiteral(resourceName: "pick")), Categories(name: "xend", image: #imageLiteral(resourceName: "xend"))]
    
    let categoryID = "CategoryId"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoriesCell.self, forCellReuseIdentifier:  categoryID)
        navigationController?.hidesBarsOnSwipe = true
        
        view.backgroundColor = UIColor.white

        
        let titlelabel = UILabel(frame: CGRect(x: 70, y: 0, width: view.frame.width - 30, height: view.frame.height))
        titlelabel.text = "Market"
        titlelabel.font = UIFont.systemFont(ofSize: 40)
        navigationItem.titleView = titlelabel
      setupNavBarButton()
    }
    
    func setupNavBarButton() {
        let searchImage = UIImage(named: "search")
        let searchButton = UIBarButtonItem(image: searchImage, style: .plain, target: self, action:  #selector(handleSearch))
        navigationItem.rightBarButtonItem = searchButton
    }

    @objc func handleSearch() {
        
    }
}

extension MarketViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: categoryID, for: indexPath) as? CategoriesCell
        cell?.setCategories(categories: items[indexPath.row])
   
        return cell!
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 420
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
