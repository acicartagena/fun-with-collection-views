//
//  TableViewCell.swift
//  CollectionViewInTableViewCell
//
//  Created by Angela Cartagena on 7/06/2016.
//  Copyright © 2016 Airtasker. All rights reserved.
//

import UIKit

class CollectionViewCell: UITableViewCell {

    static let reusableIdentifier = "CollectionViewCell"
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var flow: UICollectionViewFlowLayout! {
        didSet {
            flow.minimumLineSpacing = 8.0
            flow.itemSize = CGSizeMake(300.0, 240.0)
            flow.scrollDirection = .Horizontal
        }
    }
    
    func setupCell() {
        contentView.layoutIfNeeded()
    }
    
    override func systemLayoutSizeFittingSize(targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        collectionView.frame = CGRectMake(8.0, 8.0, targetSize.width, CGFloat(MAXFLOAT))
        collectionView.layoutIfNeeded()
        return collectionView.collectionViewLayout.collectionViewContentSize()
    }
}
