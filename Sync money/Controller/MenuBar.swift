//
//  MenuBar.swift
//  Sync money
//
//  Created by Dan  Tatar on 23/10/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import Foundation
import UIKit

class Menubar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var names = ["Money Transfer", "Insurance", "Credits", " Loans"]
    
    let cellMenuBar = "cellMenuBar"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(displayP3Red: 253/255, green: 253/255, blue: 253/255, alpha: 1)
        collectionView.register(MenuBarCell.self, forCellWithReuseIdentifier: cellMenuBar)
        setupViews()
        
        preselectFirstitem()
        
    }
    //Func that preselects first item in the collection view
    func preselectFirstitem() {
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath , animated: false, scrollPosition: .bottom)
    }
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        cV.translatesAutoresizingMaskIntoConstraints = false
        cV.backgroundColor = UIColor.clear
        cV.dataSource = self
        cV.delegate = self
        return cV
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 7).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 145, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellMenuBar, for: indexPath) as! MenuBarCell
        
        cell.nameLabel.text = names[indexPath.item]
        
        cell.backgroundColor =  UIColor(red: 253/255, green: 253/255, blue: 253/255, alpha: 1)
        return cell
    }
    
}
