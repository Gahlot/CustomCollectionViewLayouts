//
//  TagFlowLayout.swift
//  TagLayout
//
//  Created by macadmin on 30/03/20.
//  Copyright © 2020 Mahesh Gahlot. All rights reserved.
//

import Foundation
import UIKit
class TagFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributesList = super.layoutAttributesForElements(in: rect)
        var newAttributesList : [UICollectionViewLayoutAttributes] = []
        var xOffset: CGFloat = 0
        for attributes in attributesList ?? [] {
            if (attributes.frame.origin.x == self.sectionInset.left){
                xOffset = self.sectionInset.left
            }else{
                attributes.frame.origin.x = xOffset
            }
            xOffset += attributes.frame.size.width + 12
            newAttributesList.append(attributes)
        }
        return newAttributesList
    }
}
