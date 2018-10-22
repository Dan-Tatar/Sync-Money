

//
//  CategoriesCell.swift
//  Sync money
//
//  Created by Dan  Tatar on 22/10/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import Foundation
import UIKit

class CategoriesCell: UITableViewCell {
    
    let marketImageView: UIImageView = {
        let marketIV = UIImageView()
        marketIV.translatesAutoresizingMaskIntoConstraints = false
        marketIV.layer.masksToBounds  = true
        marketIV.layer.cornerRadius = 20
        return marketIV
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCategories(categories: Categories) {
        marketImageView.image = categories.image
    }
    
    func setupViews() {
        addSubview(marketImageView)
        
        marketImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        marketImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        marketImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        marketImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
}

