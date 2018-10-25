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
        
        //Title label for Market
        let titlelabel = UILabel(frame: CGRect(x: 70, y: 0, width: view.frame.width - 70, height: view.frame.height))
        titlelabel.text = "Market"
        titlelabel.font = UIFont.boldSystemFont(ofSize: 40)
        navigationItem.titleView = titlelabel
        navigationController?.navigationBar.isTranslucent = false
        
        setupNavBarButton()
        setupMenuBar()
        removeBorderNavBar()
    }
    
    
   // func to remove the border for navigation bar
    func removeBorderNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    let menuBar: Menubar = {
        let nb = Menubar()
        nb.translatesAutoresizingMaskIntoConstraints = false
        return nb
    }()
    
    let floatingView: UIView = {
        let fV = UIView()
        fV.translatesAutoresizingMaskIntoConstraints = false
        fV.backgroundColor = UIColor(displayP3Red: 41/255, green: 43/255, blue: 54/255, alpha: 0.85)
        fV.layer.cornerRadius = 25
        return fV
    }()
    
    let moneyLabel: UILabel = {
        let ml = UILabel()
        ml.translatesAutoresizingMaskIntoConstraints = false
        ml.font = UIFont.boldSystemFont(ofSize: 20)
        ml.textColor = UIColor.white
        ml.textAlignment = .center
        ml.text = "Compare Money Transfer"
        return ml
    }()
    
    func setupMenuBar() {
        
        view.addSubview(menuBar)
        view.addSubview(tableView)
        view.addSubview(floatingView)
        floatingView.addSubview(moneyLabel)
        
        //manuBar constraints
        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        menuBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        menuBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //floatingView constraints
        floatingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        floatingView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        floatingView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        floatingView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // moneyLabel constraints
        moneyLabel.bottomAnchor.constraint(equalTo: floatingView.bottomAnchor, constant: -5).isActive = true
        moneyLabel.leftAnchor.constraint(equalTo: floatingView.leftAnchor, constant: 10).isActive = true
        moneyLabel.rightAnchor.constraint(equalTo: floatingView.rightAnchor, constant: -5).isActive = true
        moneyLabel.topAnchor.constraint(equalTo: floatingView.topAnchor, constant: 10).isActive = true
    }
    
    func setupNavBarButton() {
        let searchImage = UIImage(named: "search")
        let searchButton = UIBarButtonItem(image: searchImage, style: .plain, target: self, action:  #selector(handleSearch))
        searchButton.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = searchButton
    }
    
    @objc func handleSearch() {
    print(123)
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
