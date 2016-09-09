//
//  CarouselCollectionViewLayout.swift
//  CollectionViewInTableViewCell
//
//  Created by Angela Cartagena on 9/09/2016.
//  Copyright © 2016 Airtasker. All rights reserved.
//

import UIKit

class SnapCollectionViewLayout: UICollectionViewFlowLayout {

    private var lastCollectionViewSize: CGSize = CGSizeZero
    
    private func configureInset() -> Void {
        guard let collectionView = self.collectionView else {
            return
        }
        
        let inset = collectionView.bounds.size.width / 2 - itemSize.width / 2
        collectionView.contentInset  = UIEdgeInsetsMake(0, inset, 0, inset) //top,left,bottom,right
        collectionView.contentOffset = CGPointMake(-inset, 0)
    }
}

//MARK: override methods
extension SnapCollectionViewLayout {
    
    override func invalidateLayoutWithContext(context: UICollectionViewLayoutInvalidationContext) {
        super.invalidateLayoutWithContext(context)
        
        guard let collectionView = collectionView else { return }
        if collectionView.bounds.size != lastCollectionViewSize {
            configureInset()
            lastCollectionViewSize = collectionView.bounds.size
        }
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return proposedContentOffset }
        
        let proposedRect = CGRectMake(proposedContentOffset.x, 0, collectionView.bounds.size.width, collectionView.bounds.size.height)
        guard let layoutAttributes = self.layoutAttributesForElementsInRect(proposedRect) else { return proposedContentOffset }
        
        var centerCellAttributes: UICollectionViewLayoutAttributes? = layoutAttributes.first
        let proposedContentOffsetCenterX = proposedContentOffset.x + collectionView.bounds.width/2
        
        for attributes in layoutAttributes {
            if attributes.representedElementCategory != .Cell { continue }
            
            if fabs(attributes.center.x - proposedContentOffsetCenterX) < fabs(centerCellAttributes!.center.x - proposedContentOffsetCenterX) {
                centerCellAttributes = attributes
            }
        }
        
        guard let cellAttributes = centerCellAttributes else { return proposedContentOffset }
        
        var newContentOffsetCenterX = cellAttributes.center.x - collectionView.bounds.size.width/2
        let offset = newContentOffsetCenterX - collectionView.contentOffset.x
        
        if (velocity.x < 0 && offset > 0) || (velocity.x > 0 && offset < 0) {
            let pageWidth = itemSize.width + minimumLineSpacing
            newContentOffsetCenterX += velocity.x > 0 ? pageWidth : -pageWidth
        }
        return CGPointMake(newContentOffsetCenterX, proposedContentOffset.y)
    }
    
}
