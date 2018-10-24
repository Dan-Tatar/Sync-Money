//
//  MarketViewController.swift
//  Sync money
//
//  Created by Dan  Tatar on 22/10/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController {

    var items: [Categories] = [ Categories(name: "pick", image: #imageLiteral(resourceName: "pick")), Categories(name: "xend", image: #imageLiteral(resourceName: "xend"))]
    
    let categoryID = "CategoryId"
    var tableView: UITableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoriesCell.self, forCellReuseIdentifier:  categoryID)
        navigationController?.hidesBarsOnSwipe = true
        
        view.backgroundColor = UIColor.white
        tableView.frame = CGRect(x: 0, y: 60, width: view.frame.width, height: view.frame.height)
        let titlelabel = UILabel(frame: CGRect(x: 70, y: 0, width: view.frame.width - 70, height: view.frame.height))
        titlelabel.text = "Market"
        titlelabel.font = UIFont.systemFont(ofSize: 40)
        navigationItem.titleView = titlelabel
        navigationController?.navigationBar.isTranslucent = false
      setupNavBarButton()
        
        setupMenuBar()
    }
    
    let menuBar: Menubar = {
        let nb = Menubar()
        nb.translatesAutoresizingMaskIntoConstraints = false
        return nb
    }()
    
    func setupMenuBar() {

        view.addSubview(menuBar)
        view.addSubview(tableView)
        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        menuBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        menuBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupNavBarButton() {
        let searchImage = UIImage(named: "search")
        let searchButton = UIBarButtonItem(image: searchImage, style: .plain, target: self, action:  #selector(handleSearch))
        searchButton.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = searchButton
    }

    @objc func handleSearch() {
        
    }
}

extension MarketViewController: UITableViewDelegate, UITableViewDataSource {
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: categoryID, for: indexPath) as? CategoriesCell
        cell?.setCategories(categories: items[indexPath.row])

        return cell!
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 420
    }
     func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
