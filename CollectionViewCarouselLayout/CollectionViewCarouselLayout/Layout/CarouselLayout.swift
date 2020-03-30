//
//  CarouselLayout.swift
//  CollectionViewCarouselLayout
//
//  Created by macadmin on 19/03/20.
//  Copyright © 2020 Mahesh Gahlot. All rights reserved.
//

import UIKit

class CarouselLayout: UICollectionViewFlowLayout {
    let standardAlphaValue: CGFloat = 0.5
    let standardScaleValue: CGFloat = 0.5
    
    override func prepare() {
        super.prepare()
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else{
            return nil
        }
        var newAttributes = [UICollectionViewLayoutAttributes]()
        for attribute in attributes{
            self.changeLayoutAttributes(attribute)
            newAttributes.append(attribute)
        }
        return newAttributes
    }
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    func changeLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes){
        let collectionViewCenter = collectionView!.frame.size.height/2
        let offset = collectionView!.contentOffset.y
        let itemCenterFromTop = attributes.center.y - offset
        let maxDistance = self.itemSize.height + self.minimumLineSpacing
        let distance = min(abs(collectionViewCenter - itemCenterFromTop), maxDistance)
        
        let ratio = (maxDistance - distance)/maxDistance
        attributes.alpha = ratio * (1 - standardAlphaValue) + standardAlphaValue
        let scale = ratio * (1 - standardScaleValue) + standardScaleValue
        attributes.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
    }
    //for cell snapping 
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        let layoutAttributes = self.layoutAttributesForElements(in: collectionView!.bounds)
        let center = collectionView!.frame.size.height/2
        let proposedContentOffsetCenter = proposedContentOffset.y + center
        let closet = layoutAttributes!.sorted { abs($0.center.y - proposedContentOffsetCenter) < abs($1.center.y - proposedContentOffsetCenter)
        }.first ?? UICollectionViewLayoutAttributes()
        let targetContentOffset = CGPoint(x: proposedContentOffset.x, y: floor(closet.center.y - center))
        return targetContentOffset
    }
}
