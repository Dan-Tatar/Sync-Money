//
//  MenuBarcell.swift
//  Sync money
//
//  Created by Dan  Tatar on 24/10/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import Foundation
import UIKit

class MenuBarCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isSelected: Bool {
        didSet {
            nameLabel.textColor = isSelected ? UIColor.white : UIColor.gray
            nameLabel.backgroundColor = isSelected ? UIColor.black : UIColor.clear
            print(123)
        }
    }
    
    var nameLabel: UILabel = {
        let nB = UILabel()
        nB.backgroundColor = UIColor.clear
        nB.layer.cornerRadius = 16
        nB.textColor = UIColor.gray
        nB.layer.masksToBounds = true
        nB.font = UIFont.boldSystemFont(ofSize: 18)
        nB.translatesAutoresizingMaskIntoConstraints = false
        nB.textAlignment = .center
        return nB
    }()
    

    func setupViews() {
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
    }
}
