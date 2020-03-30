//
//  TagCollectionViewCell.swift
//  TagLayout
//
//  Created by macadmin on 30/03/20.
//  Copyright © 2020 Mahesh Gahlot. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var valueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(_ name: String){
        valueLabel.text = name
        //self.backgroundColor = UIColor.red
    }
}
